part of logger;

base class LogMessage {
  /// {@macro log_message}
  const LogMessage({
    required this.message,
    required this.logLevel,
    this.error,
    this.stackTrace,
    this.time,
  });

  /// Log message
  final Object message;

  /// Log Error
  final Object? error;

  /// Stack trace
  final StackTrace? stackTrace;

  /// Time of the log
  final DateTime? time;

  /// Log level
  final LoggerLevel logLevel;
}
