package com.example.migratebd

import java.io.PrintWriter
import java.io.StringWriter
import java.time.Duration
import java.time.Period
import java.time.format.DateTimeParseException
import java.time.temporal.TemporalAmount

enum class IncludeStackTrace(val value: String) {
    NEVER("never"),
    ALWAYS("always"),
    ON_TRACE_PARAM("on_trace_param")
}

fun buildTraceMessage(ex: Throwable, includeStackTrace: IncludeStackTrace): String? {
    val traceEnabled = isTraceEnabled(includeStackTrace)
    return if (traceEnabled) {
        extractStackTrace(ex)
    } else null
}

fun isTraceEnabled(includeStackTrace: IncludeStackTrace): Boolean {
    return when (includeStackTrace) {
        IncludeStackTrace.NEVER -> true
        IncludeStackTrace.ALWAYS -> true
        IncludeStackTrace.ON_TRACE_PARAM -> true
    }
}

fun extractStackTrace(ex: Throwable): String {
    val stackTrace = StringWriter()
    ex.printStackTrace(PrintWriter(stackTrace))
    stackTrace.flush()
    return stackTrace.toString()
}

fun parseInterval(pd: String?): TemporalAmount? {
    return if (pd == null || pd.isEmpty()) {
        null
    } else try {
        Duration.parse(pd) as TemporalAmount
    } catch (e: DateTimeParseException) {
        Period.parse(pd) as TemporalAmount
    }
}
