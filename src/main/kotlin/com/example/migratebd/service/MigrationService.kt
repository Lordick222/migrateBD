package com.example.migratebd.service

import mu.KLogging
import org.apache.commons.lang3.StringUtils
import org.aspectj.util.FileUtil
import org.springframework.scheduling.annotation.Async
import org.springframework.stereotype.Service
import java.io.File
import java.time.LocalDateTime
import java.time.temporal.ChronoUnit


@Service
class MigrationService(
    private val sqlService: SqlService
) {

    private companion object : KLogging()

    val logTimeMap = mutableListOf<LogTime>()
    val logTimeMapOneMigration = mutableListOf<Pair<LogTime, LogTime>>()


    @Async
    fun migrate() {
        var log = LogTime("Migration", LocalDateTime.now(), null)
        logTimeMap.add(log)
        logger.info { "migration started" }
        migrateAdditionalTables()
        logger.info { "migration finished" }
        log.timeEnd = LocalDateTime.now()
    }

    @Async
    fun migrationBigTables() {
        var log = LogTime("Migration-big-tables", LocalDateTime.now(), null)
        logTimeMap.add(log)
        logger.info { "migration big tables started" }
        migrateAdditionalTablesBig()
        logger.info { "migration big tables finished" }
        log.timeEnd = LocalDateTime.now()
    }

    @Async
    fun migrationSystemTables() {
        var log = LogTime("Migration-system-tables", LocalDateTime.now(), null)
        logTimeMap.add(log)
        logger.info { "migration system tables started" }
        runScript("db_scripts/system_table.sql")
        logger.info { "migration system tables finished" }
        log.timeEnd = LocalDateTime.now()
    }

    fun runScript(filePath: String) {
        val pairOfSelectInsert = readSelectInsertFromFile(filePath)
        pairOfSelectInsert.forEach {
            sqlService.selectInsert(it.first, it.second)
        }
    }

    fun getTotalTime(): String {
        var resultString = ""
        logTimeMap.forEach {
            resultString = resultString.plus("${it.name} ")
            resultString = resultString.plus("started at ${it.timeStart} ")
            resultString = resultString.plus("end at ${it.timeEnd} ")
            if (it.timeEnd != null && it.timeStart != null) {
                val result = ChronoUnit.MINUTES.between(it.timeStart, it.timeEnd)
                if (result >= 60) {
                    resultString = resultString.plus("total time: ${result / 60} HH ${result % 60} MM")
                } else {
                    resultString = resultString.plus("total time: ${result} MM")
                }
            }
            resultString = resultString.plus("\n")
        }
        return resultString
    }

    fun getTotalTimeMigr(): String {
        var resultString = ""
        val resultTime = logTimeMapOneMigration.toList()
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

    @Async("sqlExecutor")
    fun migrateAdditionalTables() {
        logger.info { "migration migrateAdditionalTables started" }
        runScript("db_scripts/migration_data.sql")
        logger.info { "migration migrateAdditionalTables finished" }
    }

    @Async("sqlExecutor")
    fun migrateAdditionalTablesBig() {
        logger.info { "migration migrateAdditionalTables started" }
        runScript("db_scripts/migration_data_big_sql.sql")
        logger.info { "migration migrateAdditionalTables finished" }
    }

    fun readSelectInsertFromFile(fileName: String): List<Pair<String, String>> {
        var symbols = FileUtil
            .readAsString(File(this::class.java.classLoader.getResource(fileName).toURI()))
            .replace("\n", " ", true)
        val result = mutableListOf<Pair<String, String>>()
        var selectString = ""
        var insertString = ""
        while (true) {
            if (!symbols.contains("SELECT")) {
                break
            }
            selectString = symbols.substringAfter("SELECT").substringBefore(";")
            selectString = "SELECT$selectString;"
            var fildsToInsert =
                selectString.substringAfter("SELECT").substringBefore(" FROM ").replace(Regex("[\\[|\\]]"), "")
            val fieldNameToInsert = fildsToInsert.split(",").map { it.trim() }.toMutableList()
            symbols = StringUtils.removeIgnoreCase(symbols, selectString)
            insertString = symbols.substringAfter("INSERT").substringBefore(";")
            insertString = "INSERT$insertString;"
            val insertTableName = insertString.substringAfter("INSERT INTO ").substringBefore("(").trim()
            //TODO нужно те поля которые мы мотим заинсертить, мы должны так же передавать в селект
            if (insertTableName.equals("sys_scheduled_task", true)) {
                //TODO этого поля в новой таблице нет
                fieldNameToInsert.set(fieldNameToInsert.indexOf("PERIOD"), "period_")
            }
            var countFieldToInsert = fieldNameToInsert.size
            symbols = StringUtils.removeIgnoreCase(symbols, insertString)
            val delSubstring = insertString.substringAfter("(").substringBefore(")")
            insertString = StringUtils.replace(insertString, delSubstring, fieldNameToInsert.joinToString())
            var questionCaseString = insertString.substringAfter("VALUES(").substringBefore(")")
            insertString = StringUtils.replace(insertString, questionCaseString, getStringQuestion(countFieldToInsert))
            symbols = StringUtils.removeIgnoreCase(symbols, insertString)
            result.add(Pair(selectString, insertString))
        }
        return result
    }

    fun getStringQuestion(count: Int): String {
        val list = mutableListOf<String>()
        repeat(count) { list.add("?") }
        return list.joinToString()
    }

    fun analyzeCounts(): String {
        var result = ""
        var pairOfSelectInsert = readSelectInsertFromFile("db_scripts/system_table.sql")
        pairOfSelectInsert.forEach {
            result = result.plus(sqlService.selectCount(it.first))
        }
        pairOfSelectInsert = readSelectInsertFromFile("db_scripts/migration_data.sql")
        pairOfSelectInsert.forEach {
            result = result.plus(sqlService.selectCount(it.first))
        }
        pairOfSelectInsert = readSelectInsertFromFile("db_scripts/migration_data_big_sql.sql")
        pairOfSelectInsert.forEach {
            result = result.plus(sqlService.selectCount(it.first))
        }
        return result
    }

}