package com.example.migratebd.service

import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.launch
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service


@Service
class MigrationService(
    @Qualifier("msqlJdbcTemplate") private val msqlJdbcTemplate: JdbcTemplate,
    @Qualifier("postgresJdbcTemplate") private val postgresJdbcTemplate: JdbcTemplate
) {

    suspend fun migrate() {
        coroutineScope {
            launch {
                migrateAdditionalTables()
            }
        }
    }

    fun selectInsert(selectSql: String, insertSql: String) {
        val tableName = selectSql.substringBefore("FROM ").replace(";", "")
        val count = msqlJdbcTemplate.queryForObject("select count(1) FROM $tableName;", Int::class.java) ?: 0
        if (count <= 1000) {
            val mutableMap = select(selectSql)
            insert(insertSql, mutableMap)
        } else {
            var offset = 0;
            while (offset <= count ) {
                val mutableMap = select(selectSql, limit = 1000, offset)
                insert(insertSql, mutableMap)
                offset += 1000
                if(offset > count){
                    offset = count
                }
            }
        }
    }

    private fun insert(insertSql: String, rows: MutableList<MutableMap<String, Any>>) {
        val values = rows.map { it.values }
        values.forEach { postgresJdbcTemplate.update(insertSql, arrayListOf(it)) }
    }

    fun select(selectSql: String, limit: Int = 1000, offset: Int = 0): MutableList<MutableMap<String, Any>> {
        val selectPagination = selectSql.replace(";", "").plus(" limit ? offset ?;")
        return msqlJdbcTemplate.queryForList(selectPagination, limit, offset)
    }

    private suspend fun migrateAdditionalTables() {
        coroutineScope {
            launch {
                selectInsert(
                    "SELECT ID, ORDER_ID, LOADING_DATE, UNLOADING_DATE, RATE, TRAVEL_TIME, DISTANCE, CUSTOMER_ID, CUSTOMER_BINDING, KONIKI, MKAD, GUARANTEED_ORDER, REGION_START_ID, REGION_FINISH_ID, LAT_START, LON_START, LAT_FINISH, LON_FINISH, LOADING_TIME, UNLOADING_TIME, PLACE_START_ID, PLACE_FINISH_ID, FEDERAL_DISTRICT_START_ID FROM test_tms_LabIT.dbo.DISTR_ORDER;",
                    "INSERT INTO distr_order (id, order_id, loading_date, unloading_date, rate, travel_time, distance, customer_id, customer_binding, koniki, mkad, guaranteed_order, region_start_id, region_finish_id, lat_start, lon_start, lat_finish, lon_finish, loading_time, unloading_time, place_start_id, place_finish_id, federal_district_start_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
                )
            }
        }
    }
}