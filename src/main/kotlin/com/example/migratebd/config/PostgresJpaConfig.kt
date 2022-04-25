package com.example.migratebd.config

import com.example.migratebd.postgres.entity.AccountPostgresEntity
import com.example.migratebd.postgres.repository.AccountPostgresRepository
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
@EnableJpaRepositories(
        basePackages = ["com.example.migratebd.postgres"],
        entityManagerFactoryRef = "postgresEntityManagerFactory",
        transactionManagerRef = "postgresTransactionManager"
)
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

    @Bean
    fun postgresEntityManagerFactory(@Qualifier(value = "postgresDataSource") dataSource: javax.sql.DataSource, builder: EntityManagerFactoryBuilder): LocalContainerEntityManagerFactoryBean {
        return builder.dataSource(postgresDataSource()).packages(AccountPostgresEntity::class.java, AccountPostgresRepository::class.java).build();
    }

    @Bean
    fun postgresTransactionManager(@Qualifier("postgresEntityManagerFactory") postgresEntityManagerFactory: LocalContainerEntityManagerFactoryBean): PlatformTransactionManager {
        return JpaTransactionManager(postgresEntityManagerFactory.`object`!!)
    }
}