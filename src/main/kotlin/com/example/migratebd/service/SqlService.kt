package com.example.migratebd.service

import jvm.gismt.shared.clients.`code-verification-api-client`.Metrics
import mu.KLogging
import org.intellij.lang.annotations.Language
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.scheduling.annotation.Async
import org.springframework.stereotype.Service
import java.time.LocalDateTime
import java.util.*

@Service
class SqlService(
    @Qualifier("msqlJdbcTemplate") private val msqlJdbcTemplate: JdbcTemplate,
    @Qualifier("postgresJdbcTemplate") private val postgresJdbcTemplate: JdbcTemplate
) {

    private companion object : KLogging()

    val logTimeMapOneMigration = mutableListOf<Pair<LogTime, LogTime>>()

    @Async("sqlExecutor")
    fun selectInsert(
        @Language("MySQL") selectSql: String,
        @Language("PostgreSQL") insertSql: String,
        test: Boolean = false
    ) {
        logger.info { "Start selectInsertOf: select[$selectSql], insert = [$insertSql]" }
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
            val log = LogTime("Select $tableName", LocalDateTime.now(), null)
            val mutableMap = Metrics.timedSelect(tableName) {
                select(tableName, selectSql)
            }
            log.timeEnd = LocalDateTime.now()
            val logIns = LogTime("Insert $tableName", LocalDateTime.now(), null)
            Metrics.timedInsert(tableName) {
                generateInsetString(tableName, insertSql, mutableMap)
            }
            logIns.timeEnd = LocalDateTime.now()
            logTimeMapOneMigration.add(Pair(log, logIns))
        } else {
            var offset = 0
            var stop = false
            while (!stop) {
                val log = LogTime("Select $tableName", LocalDateTime.now(), null)
                val mutableMap = Metrics.timedSelect(tableName) {
                    select(tableName, selectSql, limit = 1000, offset)
                }
                log.timeEnd = LocalDateTime.now()
                val logIns = LogTime("Insert $tableName", LocalDateTime.now(), null)
                Metrics.timedInsert(tableName) {
                    generateInsetString(tableName, insertSql, mutableMap)
                }
                logIns.timeEnd = LocalDateTime.now()
                logTimeMapOneMigration.add(Pair(log, logIns))
                if (offset >= count) {
                    stop = true
                }
                offset += 1000
                if (offset > count) {
                    offset = count
                }
            }
        }
        logger.info { "Finised selectInsertOf: select[$selectSql], insert = [$insertSql]" }
    }


    private fun insert(tableName: String, insertSql: String, rows: MutableList<MutableMap<String, Any?>>) {
        val values = rows.map { map ->
            map.map {
                var value = try {
                    UUID.fromString(it.value.toString())
                } catch (e: Exception) {
                    null
                } ?: it.value
                if (tableName.endsWith("sec_role", true) && it.key.equals("is_default_role", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("sec_remember_me", true) && it.key.equals("version", true)) {
                    value = 0
                }
                if (tableName.endsWith("sec_filter", true) && it.key.equals("global_default", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("sec_presentation", true) && it.key.equals("is_auto_save", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("sys_server", true) && it.key.equals("is_running", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("SYS_SCHEDULED_TASK", true)
                    && (it.key.equals("is_singleton", true) || it.key.equals("is_active", true)
                            || it.key.equals("log_start", true) || it.key.equals("log_finish", true))
                ) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("tms_direction", true) && it.key.equals("is_active", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("tms_place", true) && it.key.equals("hide", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("tms_order_cancel_reason", true) && it.key.equals("commentary", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("ozon_wb", true) && it.key.equals("commentary", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("tms_reservation_users", true) && it.key.equals("permission", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("sec_user", true) &&
                    (it.key.equals("active", true)
                            || it.key.equals("change_password_at_logon", true)
                            || it.key.equals("time_zone_auto", true)
                            )
                ) {
                    value = it.value?.toString() == "1"
                }
                if (it.value?.javaClass?.name.equals("java.lang.Short")) {
                    if (value != null) {
                        when (value.toString()) {
                            "1" -> value = true
                            "0" -> value = false
                        }
                    }
                }
                value
            }
        }
//        logger.info { "insert values, count: [${values.size}]" }
        var success = true
        for (value in values) {
            try {
                postgresJdbcTemplate.update(insertSql, *value.toTypedArray())
            } catch (e: Exception) {
                success = false
                logger.error(e) { "Insert failure, sql:[$insertSql], value:[$value]" }
                break
            }
        }
//        logger.info { "insert ${if (success) "success" else "fail"}, count: [${values.size}]" }
    }

    private fun generateInsetString(tableName: String, insertSql: String, rows: MutableList<MutableMap<String, Any?>>) {
        if (rows.size == 0) return
        var resulrInsets = ""
        val values = rows.map { map ->
            resulrInsets = resulrInsets.plus("(")
            map.map {
                var value = try {
                    UUID.fromString(it.value.toString())
                } catch (e: Exception) {
                    null
                } ?: it.value
                if (tableName.endsWith("sec_role", true) && it.key.equals("is_default_role", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("sec_remember_me", true) && it.key.equals("version", true)) {
                    value = 0
                }
                if (tableName.endsWith("sec_filter", true) && it.key.equals("global_default", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("sec_presentation", true) && it.key.equals("is_auto_save", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("sys_server", true) && it.key.equals("is_running", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("SYS_SCHEDULED_TASK", true)
                    && (it.key.equals("is_singleton", true) || it.key.equals("is_active", true)
                            || it.key.equals("log_start", true) || it.key.equals("log_finish", true))
                ) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("tms_direction", true) && it.key.equals("is_active", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("tms_place", true) && it.key.equals("hide", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("tms_order_cancel_reason", true) && it.key.equals("commentary", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("ozon_wb", true) && it.key.equals("commentary", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("tms_reservation_users", true) && it.key.equals("permission", true)) {
                    value = it.value?.toString() == "1"
                }
                if (tableName.endsWith("sec_user", true) &&
                    (it.key.equals("active", true)
                            || it.key.equals("change_password_at_logon", true)
                            || it.key.equals("time_zone_auto", true)
                            )
                ) {
                    value = it.value?.toString() == "1"
                }
                if (it.value?.javaClass?.name.equals("java.lang.Short")) {
                    if (value != null) {
                        when (value.toString()) {
                            "1" -> value = true
                            "0" -> value = false
                        }
                    }
                }
//                java.lang.String
                if (it.value?.javaClass?.genericSuperclass?.equals(Number::class.java) == true) {
                    resulrInsets = resulrInsets.plus("$value,")
                } else if (it.value == null) {
                    resulrInsets = resulrInsets.plus("$value,")
                } else if (it.value?.javaClass?.equals(String::class.java) == true) {
                    value = value.toString().replace("'", "''")
                    resulrInsets = resulrInsets.plus("'$value',")
                } else {
                    resulrInsets = resulrInsets.plus("'$value',")
                }
            }
            resulrInsets = resulrInsets.dropLast(1)
            resulrInsets = resulrInsets.plus("),\n")
        }
        resulrInsets = resulrInsets.dropLast(2)
        var insertSqlNew = insertSql.substringBefore("VALUES").plus("VALUES $resulrInsets;")
        try {
            postgresJdbcTemplate.execute(insertSqlNew)
        } catch (e: Exception) {
            logger.error(e) { "Insert failure, sql:[$tableName]" }
        }
    }

    fun select(
        tableName: String,
        selectSql: String,
        limit: Int = 1000,
        offset: Int = 0
    ): MutableList<MutableMap<String, Any?>> {
        var selectPagination = selectSql
        if (!tableName.endsWith("SYS_DB_CHANGELOG", true)) {
            selectPagination = selectSql.replace(";", "").plus(" order by ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;")
            return msqlJdbcTemplate.queryForList(selectPagination, offset, limit)
        }
        return msqlJdbcTemplate.queryForList(selectPagination)
    }


    fun selectCount(
        @Language("MySQL") selectSql: String,
    ): String {
        var tableName = selectSql.substringAfter("FROM ").replace(";", "")
        var countMsql = try {
            msqlJdbcTemplate.queryForObject("select count(1) FROM $tableName;", Int::class.java) ?: 0
        } catch (e: Exception) {
            logger.error(e) { "count failure" }
            0
        }
        tableName = selectSql.substringAfter("dbo.")
        var countPsql = try {
            postgresJdbcTemplate.queryForObject("select count(1) FROM $tableName;", Int::class.java) ?: 0
        } catch (e: Exception) {
            logger.error(e) { "count failure" }
            0
        }
        if (countMsql == countPsql) {
            return "TABLE: $tableName msqlCount: $countMsql psqlCount: $countPsql OK\n"
        } else {
            return "ERRROR: $tableName msqlCount: $countMsql psqlCount: $countPsql\n"
        }
    }
}