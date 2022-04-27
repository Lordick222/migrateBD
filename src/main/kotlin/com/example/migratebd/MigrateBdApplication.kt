package com.example.migratebd

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.scheduling.annotation.EnableAsync


//@SpringBootApplication(exclude = [DataSourceAutoConfiguration::class])
@SpringBootApplication
@EnableAsync
class MigrateBdApplication

fun main(args: Array<String>) {
    runApplication<MigrateBdApplication>(*args)
}
