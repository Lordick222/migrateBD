package com.example.migratebd.controllers

import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController()
@RequestMapping("/msql-accounts")
class AccountMsqlController(@Qualifier("msqlJdbcTemplate") val jdbcTemplate: JdbcTemplate) {

    @PostMapping("/acc")
    fun sendMessage(): Int {
        jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS favorite_beers(id INT, name VARCHAR(50))")
        return 1
    }
}