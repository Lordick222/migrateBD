package com.example.migratebd.service

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import mu.KLogging
import org.apache.commons.lang3.StringUtils
import org.aspectj.util.FileUtil
import org.intellij.lang.annotations.Language
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.scheduling.annotation.Async
import org.springframework.stereotype.Service
import java.io.File
import java.util.*


@Service
class MigrationService(
    @Qualifier("msqlJdbcTemplate") private val msqlJdbcTemplate: JdbcTemplate,
    @Qualifier("postgresJdbcTemplate") private val postgresJdbcTemplate: JdbcTemplate
) {

    private companion object : KLogging()

    suspend fun migrate() = coroutineScope {
        logger.info { "migration started" }
        async {
            migrateAdditionalTables()
        }
        logger.info { "migration finished" }
    }

    suspend fun migrationBigTables() = coroutineScope {
        logger.info { "migration big tables started" }
        async(Dispatchers.IO) {
            selectInsert(
                "SELECT ID, DATE_, RESULT_, MESSAGE, MESSAGE_ERROR, ORDER_ID FROM test_tms_LabIT.dbo.TMS_ONE_S_CANCEL_ORDER_HISTORY;",
                "INSERT INTO tms_one_s_cancel_order_history (id, date_, result_, message, message_error, order_id) VALUES(?, ?, ?, ?, ?, ?);",
                test = true
            )
        }
        async(Dispatchers.IO) {
            selectInsert(
                "SELECT ID, DATE_, RESULT_, MESSAGE, MESSAGE_ERROR FROM test_tms_LabIT.dbo.TMS_ONE_S_ORDER_HISTORY;",
                "INSERT INTO tms_one_s_order_history (id, date_, result_, message, message_error) VALUES(?, ?, ?, ?, ?);",
                test = true
            )
        }
        logger.info { "migration big tables finished" }
    }

    suspend fun selectInsert(
        @Language("MySQL") selectSql: String,
        @Language("PostgreSQL") insertSql: String,
        test: Boolean = false
    ) {
        val tableName = selectSql.substringAfter("FROM ").replace(";", "")
        logger.info { "select count in table, tableName:[$tableName]" }
        var count = try {
            msqlJdbcTemplate.queryForObject("select count(1) FROM $tableName;", Int::class.java) ?: 0
        } catch (e: Exception) {
            logger.error(e) { "count failure" }
            0
        }
        logger.info { "select count in table, tableName:[$tableName], count:[$count]" }
        if (count == 0) return

        if (test) count = 1555

        if (count <= 1000) {
            val mutableMap = select(selectSql)
            insert(insertSql, mutableMap)
        } else {
            var offset = 0
            var stop = false
            while (!stop) {
                val mutableMap = select(selectSql, limit = 1000, offset)
                insert(insertSql, mutableMap)
                if (offset >= count) {
                    stop = true
                }
                offset += 1000
                if (offset > count) {
                    offset = count
                }
            }
        }
    }

    private fun insert(insertSql: String, rows: MutableList<MutableMap<String, Any>>) {
        val values = rows.map { map ->
            map.map {
                try {
                    UUID.fromString(it.value.toString())
                } catch (e: Exception) {
                    null
                } ?: it.value
            }
        }
        logger.info { "insert values, count: [${values.size}]" }
        var success = true
        values.forEach {
            val value = it.toTypedArray()
            try {
                postgresJdbcTemplate.update(insertSql, *value)
            } catch (e: Exception) {
                success = false
                logger.error(e) { "Insert failure, sql:[$insertSql], value:[$it]" }
            }
        }
        logger.info { "insert ${if (success) "success" else "fail"}, count: [${values.size}]" }
    }

    fun select(selectSql: String, limit: Int = 1000, offset: Int = 0): MutableList<MutableMap<String, Any>> {
        val selectPagination = selectSql.replace(";", "").plus(" order by ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;")
        return msqlJdbcTemplate.queryForList(selectPagination, offset, limit)
    }

    private suspend fun migrateAdditionalTables() = coroutineScope {
        logger.info { "migration migrateAdditionalTables started" }
        var pairOfSelectInsert = readSelectInsertFromFile("db_scripts/migration_data.sql")
        pairOfSelectInsert.forEach {
            logger.info { "Start selectInsertOf : ${it.first} , ${it.second}" }
            selectInsert(it.first, it.second)
            logger.info { "Finised selectInsertOf : ${it.first} , ${it.second}" }
        }
        logger.info { "migration migrateAdditionalTables finished" }
    }

    fun readSelectInsertFromFile(fileName: String): List<Pair<String, String>> {
        var symbols = FileUtil
                .readAsString(File(fileName))
                .replace("\n", " ", true)
        val result = mutableListOf<Pair<String, String>>()
        var selectString = ""
        var insertString = ""
        while (true) {
            if (!symbols.contains("SELECT")) {
                break;
            }
            selectString = symbols.substringAfter("SELECT").substringBefore(";")
            selectString = "SELECT$selectString;"
            symbols = StringUtils.removeIgnoreCase(symbols, selectString);
            insertString = symbols.substringAfter("INSERT").substringBefore(";")
            insertString = "INSERT$insertString;"
            symbols = StringUtils.removeIgnoreCase(symbols, insertString);
            result.add(Pair(selectString, insertString))
        }
        return result
    }
}