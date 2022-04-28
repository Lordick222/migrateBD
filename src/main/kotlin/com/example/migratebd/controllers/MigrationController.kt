package com.example.migratebd.controllers

import com.example.migratebd.service.MigrationService
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class MigrationController(private val migrationService: MigrationService) {

    @GetMapping("/migration")
    suspend fun migration() = migrationService.migrate()

    @GetMapping("/migration-big-tables")
    suspend fun migrationBigTables(): String {
        migrationService.migrationBigTables()
        return "Миграция запущена"
    }

    @GetMapping("/migration-system-tables")
    suspend fun migrationSystemTables() = migrationService.migrationSystemTables()

    @PostMapping("/total-time")
    fun getTotalTime(): String {
        return migrationService.getTotalTime()
    }

    @PostMapping("/total-counts")
    fun getAnalyzeCounts(): String {
        return migrationService.analyzeCounts()
    }
}