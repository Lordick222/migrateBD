package com.example.migratebd.service

import java.time.Duration
import java.time.LocalDateTime

data class LogTime(
        var name: String?,
        var timeStart: Duration?,
        var timeEnd: Duration?,
)
