package com.example.migratebd

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication


//@SpringBootApplication(exclude = [DataSourceAutoConfiguration::class])
@SpringBootApplication
class MigrateBdApplication

fun main(args: Array<String>) {
    runApplication<MigrateBdApplication>(*args)
}
