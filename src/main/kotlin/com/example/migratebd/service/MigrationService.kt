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

            }
        }
    }
}