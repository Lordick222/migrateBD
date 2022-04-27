package com.example.migratebd.controllers

import com.example.migratebd.service.MigrationService
import org.springframework.web.bind.annotation.GetMapping
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
}