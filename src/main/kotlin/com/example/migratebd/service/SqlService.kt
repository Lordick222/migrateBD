package com.example.migratebd.service

import com.example.migratebd.Metrics
import mu.KLogging
import org.intellij.lang.annotations.Language
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.scheduling.annotation.Async
import org.springframework.stereotype.Service
import java.time.LocalDateTime
import java.time.temporal.ChronoUnit
import java.util.*
import kotlin.collections.HashSet

@Service
class SqlService(
        @Qualifier("msqlJdbcTemplate") private val msqlJdbcTemplate: JdbcTemplate,
        @Qualifier("postgresJdbcTemplate") private val postgresJdbcTemplate: JdbcTemplate
) {

    private companion object : KLogging()

    val logTimeMapOneMigration = mutableListOf<Pair<LogTime, LogTime>>()
    val errors = mutableListOf<String>()


    fun getTotalTimeMigr(): String {
        var resultString = ""
        val resultTime = logTimeMapOneMigration.subList(logTimeMapOneMigration.lastIndex - Math.min(100, logTimeMapOneMigration.size - 1), logTimeMapOneMigration.lastIndex)
        resultTime.forEach {
            resultString = resultString.plus("${it.first.name} ")
            resultString = resultString.plus("started at ${it.first.timeStart} ")
            resultString = resultString.plus("end at ${it.first.timeEnd} ")
            if (it.first.timeEnd != null && it.first.timeStart != null) {
                val result = ChronoUnit.MILLIS.between(it.first.timeStart, it.first.timeEnd)
                resultString = resultString.plus("total time: ${result} mmils")
            }
            resultString = resultString.plus("\n")
            resultString = resultString.plus("${it.second.name} ")
            resultString = resultString.plus("started at ${it.second.timeStart} ")
            resultString = resultString.plus("end at ${it.second.timeEnd} ")
            if (it.second.timeEnd != null && it.second.timeStart != null) {
                val result = ChronoUnit.MILLIS.between(it.second.timeStart, it.second.timeEnd)
                resultString = resultString.plus("total time: ${result} mmils")
            }
            resultString = resultString.plus("\n")
        }
        return resultString
    }

    fun getTotalTimeMigrTotal(): String {
        var resultString = ""
        val resultTime = logTimeMapOneMigration.toList()
        resultString = resultString.plus("Started at: ")
                .plus(resultTime.get(0).first.timeStart)
                .plus(" end at: ")
                .plus(resultTime.get(resultTime.lastIndex).first.timeEnd)
        return resultString
    }

    fun getErrors(): String {
        var resultString = ""
        val result = errors.toList()
        result.forEach {
            resultString = resultString.plus(it)
        }
        return resultString
    }

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

        if (count <= 200) {
            val log = LogTime("Select $tableName", LocalDateTime.now(), null)
            val mutableMap = Metrics.timedSelect(tableName) {
                selectByTop(tableName, selectSql, 200, null)
            }
            log.timeEnd = LocalDateTime.now()
            val logIns = LogTime("Insert $tableName", LocalDateTime.now(), null)
            Metrics.timedInsert(tableName) {
                generateInsetString(tableName, insertSql, mutableMap, 200, null)
            }
            logIns.timeEnd = LocalDateTime.now()
            logTimeMapOneMigration.add(Pair(log, logIns))
        } else {
            var stop = false
            var maxValue: Any? = null
            while (!stop) {
                val log = LogTime("Select $tableName", LocalDateTime.now(), null)
                val mutableMap = Metrics.timedSelect(tableName) {
                    selectByTop(tableName, selectSql, limit = 200, maxValue)
                }
                log.timeEnd = LocalDateTime.now()
                if (mutableMap.isEmpty()) {
                    maxValue = getLastId(tableName, selectSql, 200, maxValue)
                } else {
                    val logIns = LogTime("Insert $tableName", LocalDateTime.now(), null)
                    Metrics.timedInsert(tableName) {
                        generateInsetString(tableName, insertSql, mutableMap, 200, maxValue)
                    }
                    if (mutableMap.size < 200) stop = true
                    mutableMap.get(mutableMap.lastIndex).map {
                        if (it.key.equals("ID", true)) maxValue = it.value!!
                    }
                    logIns.timeEnd = LocalDateTime.now()
                    logTimeMapOneMigration.add(Pair(log, logIns))
                }
            }
        }
        logger.info { "Finised selectInsertOf: select[$selectSql], insert = [$insertSql]" }
    }

    @Async("sqlExecutor")
    fun selectInsertById(
            @Language("MySQL") selectSql: String,
            @Language("PostgreSQL") insertSql: String,
            test: Boolean = false,
            listStartIds: MutableList<FromIdStartDro>
    ) {
        val tableName = selectSql.substringAfter("FROM ").replace(";", "").trim()
        var start = false
        var maxValue: Any? = null
        listStartIds.forEach {
            if (it.tableName.equals(tableName, true)) {
                start = true
                maxValue = it.Id
            }
        }
        if (start == false) return
        var count = try {
            msqlJdbcTemplate.queryForObject("select count(1) FROM $tableName;", Int::class.java) ?: 0
        } catch (e: Exception) {
            logger.error(e) { "count failure" }
            0
        }
        logger.info { "select count in table, tableName:[$tableName], count:[$count]" }
        if (count == 0) return
        if (test) count = 1555
        if (count <= 200) {
            val log = LogTime("Select $tableName", LocalDateTime.now(), null)
            val mutableMap = Metrics.timedSelect(tableName) {
                selectByTop(tableName, selectSql, 200, maxValue)
            }
            log.timeEnd = LocalDateTime.now()
            val logIns = LogTime("Insert $tableName", LocalDateTime.now(), null)
            Metrics.timedInsert(tableName) {
                generateInsetString(tableName, insertSql, mutableMap, 200, maxValue)
            }
            logIns.timeEnd = LocalDateTime.now()
            logTimeMapOneMigration.add(Pair(log, logIns))
        } else {
            var stop = false
            while (!stop) {
                val log = LogTime("Select $tableName", LocalDateTime.now(), null)
                val mutableMap = Metrics.timedSelect(tableName) {
                    selectByTop(tableName, selectSql, limit = 200, maxValue)
                }
                log.timeEnd = LocalDateTime.now()
                if (mutableMap.isEmpty()) {
                    maxValue = getLastId(tableName, selectSql, 200, maxValue)
                } else {
                    val logIns = LogTime("Insert $tableName", LocalDateTime.now(), null)
                    Metrics.timedInsert(tableName) {
                        generateInsetString(tableName, insertSql, mutableMap, 200, maxValue)
                    }
                    if (mutableMap.size < 200) stop = true
                    mutableMap.get(mutableMap.lastIndex).map {
                        if (it.key.equals("ID", true)) maxValue = it.value!!
                    }
                    logIns.timeEnd = LocalDateTime.now()
                    logTimeMapOneMigration.add(Pair(log, logIns))
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

    private fun generateInsetString(tableName: String, insertSql: String, rows: MutableList<MutableMap<String, Any?>>, limit: Int, afterValue: Any?) {
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
            e.printStackTrace()
            val msg = "Insert failure, sql:[$tableName] from limit: $limit afterMaxValue: $afterValue\n"
            errors.add(msg)
            logger.error(e) { msg }
        }
    }

    fun select(
            tableName: String,
            selectSql: String,
            limit: Int = 200,
            offset: Int = 0
    ): MutableList<MutableMap<String, Any?>> {
        var selectPagination = selectSql
        if (!tableName.endsWith("SYS_DB_CHANGELOG", true)) {
            selectPagination = selectSql.replace(";", "").plus(" order by ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;")
            return msqlJdbcTemplate.queryForList(selectPagination, offset, limit)
        }
        return msqlJdbcTemplate.queryForList(selectPagination)
    }

    fun selectByTop(
            tableName: String,
            selectSql: String,
            limit: Int = 200,
            maxValue: Any?
    ): MutableList<MutableMap<String, Any?>> {
        try {
            var selectPagination = selectSql
            if (!tableName.endsWith("SYS_DB_CHANGELOG", true)) {
                if (maxValue == null) {
                    selectPagination = selectSql
                            .replace(";", "")
                            .replace("SELECT", "SELECT TOP($limit)")
                            .plus(" ORDER BY ID;")
                    return msqlJdbcTemplate.queryForList(selectPagination)
                } else {
                    selectPagination = selectSql
                            .replace(";", "")
                            .replace("SELECT", "SELECT TOP($limit) ")
                            .plus(" WHERE ID > ? ORDER BY ID;")
                    return msqlJdbcTemplate.queryForList(selectPagination, maxValue)
                }
            }
            return msqlJdbcTemplate.queryForList(selectPagination)
        } catch (e: Exception) {
            val msg = "Select failure, sql:[$tableName] from limit: $limit afterMaxValue: $maxValue\n"
            errors.add(msg)
            logger.error(e) { msg }
            return mutableListOf()
        }
    }

    fun getLastId(
            tableName: String,
            selectSql: String,
            limit: Int = 200,
            maxValue: Any?
    ): Any? {
        var selectPagination = ""
        if (maxValue != null) {
            selectPagination = selectSql
                    .plus("select *.ID from ")
                    .plus(" $tableName WHERE ID > ?")
                    .plus(" ORDER BY ID;")
            val result = msqlJdbcTemplate.queryForList(selectPagination, maxValue)
            return result.get(result.lastIndex)
        } else {
            selectPagination = selectSql
                    .plus("select *.ID from ")
                    .plus(" $tableName ")
                    .plus(" ORDER BY ID;")
            val result = msqlJdbcTemplate.queryForList(selectPagination, maxValue)
            return result.get(result.lastIndex)
        }
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

    @Async
    fun selectInsertWithDiff(
            @Language("MySQL") selectSql: String,
            @Language("PostgreSQL") insertSql: String,
            test: Boolean = false,
            listStartIds: MutableList<FromIdStartDro>
    ) {
        val tableName = selectSql.substringAfter("FROM ").replace(";", "").trim()
        var isUUId = false
        var start = false
        listStartIds.forEach {
            if (it.tableName.equals(tableName, true)) {
                start = true
                isUUId = it.isUUID
            }
        }
        if (start == false) return
        var mssqlIds = selectByTopIdsMssql(tableName, selectSql, 100000)
        val psqlIds = selectByTopIdsPssql(tableName, selectSql, 100000)
//        if(isUUId) mssqlIds = mssqlIds.mapTo(psqlIds) { UUID.fromString(it as String?) }
        mssqlIds.removeAll(psqlIds.map { it.toString().uppercase() })
        var idsToInsert = mssqlIds.toList()
        var count = 0;
        var size = 200
        while (true) {
            val log = LogTime("Select $tableName", LocalDateTime.now(), null)
            var mutableMap = selectByIds(tableName, selectSql, idsToInsert.subList(count, Math.min(idsToInsert.size, count + size)))
            log.timeEnd = LocalDateTime.now()
            val logIns = LogTime("Insert $tableName", LocalDateTime.now(), null)
            generateInsetString(tableName, insertSql, mutableMap, -1, null)
            logIns.timeEnd = LocalDateTime.now()
            logTimeMapOneMigration.add(Pair(log, logIns))
            if (mutableMap.size < size) break;
            count += size
        }
        logger("For $tableName psqlIds[${psqlIds.size}], mssqlIds[${mssqlIds.size}]")
        logger.info { "Finised selectInsertWithDiff: select[$selectSql], insert = [$insertSql]" }
    }

    fun selectByTopIdsMssql(
            tableName: String,
            selectSql: String,
            limit: Int = 20000
    ): HashSet<Any> {
        try {
            var selectPagination = selectSql
            val stringToReplace = selectPagination.substringAfter("SELECT ").substringBefore(" FROM")
            selectPagination = selectPagination.replace(stringToReplace, " ID ")
            var maxValue: Any? = null
            var flag = true
            var resultList = kotlin.collections.HashSet<Any>()
            while (flag) {
                val log = LogTime("Select $tableName", LocalDateTime.now(), null)
                if (maxValue == null) {
                    selectPagination = selectPagination
                            .replace(";", "")
                            .replace("SELECT", "SELECT TOP($limit)")
                            .plus(" ORDER BY ID;")
                    var result = msqlJdbcTemplate.queryForList(selectPagination)
                    maxValue = result.get(result.size - 1).values.first()
                    result.forEach { map ->
                        map.forEach {
                            resultList.add(it.value)
                        }
                    }
                    if (result.size < limit) flag = false
                    selectPagination = selectPagination
                            .replace("ORDER BY ID", " WHERE ID > ? ORDER BY ID ")
                } else {
                    var result = msqlJdbcTemplate.queryForList(selectPagination, maxValue)
                    maxValue = result.get(result.size - 1).values.first()
                    result.forEach { map ->
                        map.forEach {
                            resultList.add(it.value)
                        }
                    }
                    if (result.size < limit) flag = false
                }
                log.timeEnd = LocalDateTime.now()
                val logIns = LogTime("Insert $tableName", LocalDateTime.now(), null)
                logIns.timeEnd = LocalDateTime.now()
                logTimeMapOneMigration.add(Pair(log, logIns))
            }
            return resultList
        } catch (e: Exception) {
            e.printStackTrace()
            return kotlin.collections.HashSet<Any>()
        }
    }

    fun selectByTopIdsPssql(
            tableName: String,
            selectSql: String,
            limit: Int
    ): HashSet<Any> {
        try {
            var selectPagination = selectSql.replace("tms.dbo.", " ")
            val stringToReplace = selectPagination.substringAfter("SELECT ").substringBefore(" FROM")
            selectPagination = selectPagination.replace(stringToReplace, " ID ")
            var maxValue: Any? = null
            var flag = true
            var resultList = kotlin.collections.HashSet<Any>()
            while (flag) {
                val log = LogTime("Select $tableName", LocalDateTime.now(), null)
                if (maxValue == null) {
                    selectPagination = selectPagination
                            .replace(";", "")
                            .plus(" ORDER BY ID LIMIT($limit);")
                    var result = postgresJdbcTemplate.queryForList(selectPagination)
                    maxValue = result.get(result.size - 1).values.first()
                    result.forEach { map ->
                        map.forEach {
                            resultList.add(it.value)
                        }
                    }
                    if (result.size < limit) flag = false
                    selectPagination = selectPagination
                            .replace("ORDER BY ID", " WHERE ID > ? ORDER BY ID ")
                } else {
                    var result = postgresJdbcTemplate.queryForList(selectPagination, maxValue)
                    if (result.isEmpty()) return resultList
                    maxValue = result.get(result.size - 1).values.first()
                    result.forEach { map ->
                        map.forEach {
                            resultList.add(it.value)
                        }
                    }
                    if (result.size < limit) flag = false
                }
                log.timeEnd = LocalDateTime.now()
                val logIns = LogTime("Insert $tableName", LocalDateTime.now(), null)
                logIns.timeEnd = LocalDateTime.now()
                logTimeMapOneMigration.add(Pair(log, logIns))
            }
            return resultList
        } catch (e: Exception) {
            e.printStackTrace()
            return kotlin.collections.HashSet<Any>()
        }
    }

    fun selectByIds(
            tableName: String,
            selectSql: String,
            listIds: kotlin.collections.List<Any>
    ): MutableList<MutableMap<String, Any?>> {
        try {
            var idsString = listIds.joinToString("','","'", "'")
            var selectPagination = selectSql
                    .replace(";", "")
                    .plus(" WHERE ID IN ($idsString);")
            return msqlJdbcTemplate.queryForList(selectPagination)
        } catch (e: Exception) {
            return mutableListOf()
        }
    }
}