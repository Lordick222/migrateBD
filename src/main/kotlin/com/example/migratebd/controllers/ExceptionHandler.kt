package com.example.migratebd.controllers

import com.example.migratebd.IncludeStackTrace
import com.example.migratebd.buildTraceMessage
import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.databind.PropertyNamingStrategy
import com.fasterxml.jackson.databind.annotation.JsonNaming
import org.springframework.beans.factory.annotation.Value
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import java.util.*

@ControllerAdvice
class ExceptionHandler(
    @Value("\${server.error.include-stacktrace:never}") private val includeStackTrace: IncludeStackTrace
) {

    @ExceptionHandler(Exception::class)
    fun handleTaskException(
        ex: Exception,
        locale: Locale
    ): ResponseEntity<Any> {

        val trace = buildTraceMessage(ex, includeStackTrace)
        val apiError = ApiError("", ex.message, trace)

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(apiError)
    }

}

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy::class)
data class ApiError(
    val errorCode: String,
    val errorDescription: String?,
    val trace: String? = null
)