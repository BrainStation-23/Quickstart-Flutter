part of logger;

extension on DateTime {
  /// Transforms DateTime to String with format: 00:00:00
  String formatTime() =>
      [hour, minute, second].map((i) => i.toString().padLeft(2, '0')).join(':');
}

extension on logging.LogRecord {
  /// Transforms [logging.LogRecord] to [LogMessage]
  LogMessage toLogMessage() => LogMessage(
    message: message,
    error: error,
    stackTrace: stackTrace,
    time: time,
    logLevel: level.toLoggerLevel(),
  );
}

extension on logging.Level {
  /// Transforms [logging.Level] to [LoggerLevel]
  LoggerLevel toLoggerLevel() => switch (this) {
    logging.Level.SEVERE => LoggerLevel.error,
    logging.Level.WARNING => LoggerLevel.warning,
    logging.Level.INFO => LoggerLevel.info,
    logging.Level.FINE || logging.Level.FINER => LoggerLevel.debug,
    _ => LoggerLevel.verbose,
  };
}

extension on LoggerLevel {
  /// Transforms [LoggerLevel] to emoji
  String get emoji => switch (this) {
    LoggerLevel.error => '🔥',
    LoggerLevel.warning => '⚠️',
    LoggerLevel.info => '💡',
    LoggerLevel.debug => '🐛',
    LoggerLevel.verbose => '🔬',
  };
}