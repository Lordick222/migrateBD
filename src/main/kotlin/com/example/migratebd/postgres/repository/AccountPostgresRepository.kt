package com.example.migratebd.postgres.repository

import com.example.migratebd.postgres.entity.AccountPostgresEntity
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface AccountPostgresRepository : CrudRepository<AccountPostgresEntity, String> {

    fun findByid(id: Int): AccountPostgresEntity
}