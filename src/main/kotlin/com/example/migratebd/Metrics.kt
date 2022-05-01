package com.example.migratebd

import io.micrometer.core.instrument.Metrics
import io.micrometer.core.instrument.Timer
import java.util.concurrent.ConcurrentHashMap

internal object Metrics {

  private val PERCENTILES: DoubleArray = doubleArrayOf(0.5, 0.9, 0.99)

  private val TABLES_TIME_MAP: ConcurrentHashMap<String, Timer> = ConcurrentHashMap()

  internal inline fun <T> timedSelect(tableName: String, block: () -> T): T {
    val timer = timedSelect(tableName)
    val t = Timer.start()
    return try {
      block.invoke()
    } finally {
      t.stop(timer)
    }
  }

  internal inline fun <T> timedInsert(tableName: String, block: () -> T): T {
    val timer = timedInsert(tableName)
    val t = Timer.start()
    return try {
      block.invoke()
    } finally {
      t.stop(timer)
    }
  }

  internal fun timedSelect(tableName: String): Timer {
    val metricName = "table.select.time"
    val timer = TABLES_TIME_MAP.getOrPut("table.select.time$tableName") {
      Timer.builder(metricName)
        .tag("tableName", tableName)
        .publishPercentiles(*PERCENTILES)
        .publishPercentileHistogram()
        .register(Metrics.globalRegistry)
    }
    return timer
  }

  internal fun timedInsert(tableName: String): Timer {
    val metricName = "table.insert.time"
    val timer = TABLES_TIME_MAP.getOrPut("table.insert.time$tableName") {
      Timer.builder(metricName)
        .tag("tableName", tableName)
        .publishPercentiles(*PERCENTILES)
        .publishPercentileHistogram()
        .register(Metrics.globalRegistry)
    }
    return timer
  }
}