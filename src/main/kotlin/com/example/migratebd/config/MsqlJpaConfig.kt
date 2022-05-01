package com.example.migratebd.config

import com.zaxxer.hikari.HikariDataSource
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties
import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.jdbc.core.JdbcTemplate


@Configuration
class MsqlJpaConfig {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.msql")
    fun msqlDsProperties(): DataSourceProperties {
        return DataSourceProperties()
    }

    @Bean
    fun msqlDataSource(): javax.sql.DataSource {
        return msqlDsProperties().initializeDataSourceBuilder().type(HikariDataSource::class.java).build()
    }

    @Bean
    fun msqlJdbcTemplate(@Qualifier(value = "msqlDataSource") dataSource: javax.sql.DataSource): JdbcTemplate {
        return JdbcTemplate(dataSource)
    }
}