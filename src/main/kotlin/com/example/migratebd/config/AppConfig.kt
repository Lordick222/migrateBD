package com.example.migratebd.config

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor

@Configuration
class AppConfig {

    @Bean
    fun sqlExecutor(): ThreadPoolTaskExecutor? {
        return ThreadPoolTaskExecutor().also {
            it.setThreadNamePrefix("sql-task-")
            it.corePoolSize = 8
            it.maxPoolSize = 200
            it.setQueueCapacity(10)
        }
    }
}