package com.example.migratebd.msql.entity

import javax.persistence.*

@Entity
@Table(name = "accounts")
class MsqlAccountEntity(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(nullable = false, name = "user_id")
        val id: Int,

        @Column(nullable = false, name = "username")
        val username: String,

        @Column(nullable = false, name = "password")
        val password: String,

        @Column(nullable = false, name = "email")
        val email: String
)