package com.example.migratebd.config

import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties
import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.data.jpa.repository.config.EnableJpaRepositories
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.orm.jpa.JpaTransactionManager
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean
import org.springframework.transaction.PlatformTransactionManager
import org.springframework.transaction.annotation.EnableTransactionManagement


@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
        basePackages = ["com.example.migratebd.msql"],
        entityManagerFactoryRef = "msqlEntityManagerFactory",
        transactionManagerRef = "msqlTransactionManager"
)
class MsqlJpaConfig {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.msql")
    fun msqlDsProperties(): DataSourceProperties {
        return DataSourceProperties()
    }

    @Bean
    fun msqlDataSource(): javax.sql.DataSource {
        return msqlDsProperties().initializeDataSourceBuilder().build()
    }

    @Bean
    fun msqlJdbcTemplate(@Qualifier(value = "msqlDataSource") dataSource: javax.sql.DataSource): JdbcTemplate {
        return JdbcTemplate(dataSource)
    }

    @Bean
    fun msqlEntityManagerFactory(@Qualifier(value = "msqlDataSource") dataSource: javax.sql.DataSource, builder: EntityManagerFactoryBuilder): LocalContainerEntityManagerFactoryBean {
        return builder.dataSource(msqlDataSource()).packages("com.example.migratebd.msql").build();
    }

    @Bean
    fun msqlTransactionManager(@Qualifier("msqlEntityManagerFactory") msqlEntityManagerFactory: LocalContainerEntityManagerFactoryBean): PlatformTransactionManager {
        return JpaTransactionManager(msqlEntityManagerFactory.`object`!!)
    }
}