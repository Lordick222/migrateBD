package com.example.migratebd.service

import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import mu.KLogging
import org.intellij.lang.annotations.Language
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service
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
        async {
            selectInsert(
                "SELECT ID, DATE_, RESULT_, MESSAGE, MESSAGE_ERROR, ORDER_ID FROM test_tms_LabIT.dbo.TMS_ONE_S_CANCEL_ORDER_HISTORY;",
                "INSERT INTO tms_one_s_cancel_order_history (id, date_, result_, message, message_error, order_id) VALUES(?, ?, ?, ?, ?, ?);",
                test = true
            )
        }
        async {
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
                logger.error(e){"Insert failure, sql:[$insertSql], value:[$it]"}
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
        selectInsert(
            "SELECT ID, ORDER_ID, LOADING_DATE, UNLOADING_DATE, RATE, TRAVEL_TIME, DISTANCE, CUSTOMER_ID, CUSTOMER_BINDING, KONIKI, MKAD, GUARANTEED_ORDER, REGION_START_ID, REGION_FINISH_ID, LAT_START, LON_START, LAT_FINISH, LON_FINISH, LOADING_TIME, UNLOADING_TIME, PLACE_START_ID, PLACE_FINISH_ID, FEDERAL_DISTRICT_START_ID FROM test_tms_LabIT.dbo.DISTR_ORDER;",
            "INSERT INTO distr_order (id, order_id, loading_date, unloading_date, rate, travel_time, distance, customer_id, customer_binding, koniki, mkad, guaranteed_order, region_start_id, region_finish_id, lat_start, lon_start, lat_finish, lon_finish, loading_time, unloading_time, place_start_id, place_finish_id, federal_district_start_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
        )
        logger.info { "migration migrateAdditionalTables finished" }
    }
}