package com.example.migratebd.msql.repository

import com.example.migratebd.msql.entity.MsqlAccountEntity
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface AccountMsqlRepository : CrudRepository<MsqlAccountEntity, String> {

}