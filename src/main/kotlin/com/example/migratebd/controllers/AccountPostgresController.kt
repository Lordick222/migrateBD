package com.example.migratebd.controllers

import com.example.migratebd.postgres.entity.AccountPostgresEntity
import com.example.migratebd.postgres.repository.AccountPostgresRepository
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController()
@RequestMapping("/accounts")
class AccountPostgresController(val accountPostgresRepository: AccountPostgresRepository) {

    @PostMapping("/acc")
    fun sendMessage(): MutableIterable<AccountPostgresEntity> {
        return accountPostgresRepository.findAll()
    }
}