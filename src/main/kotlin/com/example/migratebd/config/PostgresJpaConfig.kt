package com.example.migratebd.config

import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties
import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.jdbc.core.JdbcTemplate


@Configuration
class PostgresJpaConfig {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.postgres")
    fun postgresDsProperties(): DataSourceProperties {
        return DataSourceProperties()
    }

    @Bean
    fun postgresDataSource(): javax.sql.DataSource {
        return postgresDsProperties().initializeDataSourceBuilder().build()
    }

    @Bean
    fun postgresJdbcTemplate(@Qualifier(value = "postgresDataSource") dataSource: javax.sql.DataSource): JdbcTemplate {
        return JdbcTemplate(dataSource)
    }
}