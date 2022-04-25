package com.example.migratebd.controllers

import com.example.migratebd.msql.entity.MsqlAccountEntity
import com.example.migratebd.msql.repository.AccountMsqlRepository
import com.example.migratebd.postgres.entity.AccountPostgresEntity
import com.example.migratebd.postgres.repository.AccountPostgresRepository
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController()
@RequestMapping("/msql-accounts")
class AccountMsqlController(val accountMsqlRepository: AccountMsqlRepository) {

    @PostMapping("/acc")
    fun sendMessage(): MutableIterable<MsqlAccountEntity> {
        return accountMsqlRepository.findAll()
    }
}