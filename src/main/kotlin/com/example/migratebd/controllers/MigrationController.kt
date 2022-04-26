package com.example.migratebd.controllers

import com.example.migratebd.service.MigrationService
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController()
@RequestMapping("/")
class MigrationController(val migrationService: MigrationService) {

    @GetMapping("/migration")
    suspend fun migration(): String {
        migrationService.migrate()
        return "Миграция запущена"
    }
}