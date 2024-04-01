part of logger;

abstract base class LoggerBase {
  /// Logs the error to the console
  void error(Object message, {Object? error, StackTrace? stackTrace});

  /// Logs the warning to the console
  void warning(Object message);

  /// Logs the info to the console
  void info(Object message);

  /// Logs the debug to the console
  void debug(Object message);

  /// Logs the verbose to the console
  void verbose(Object message);

  /// Set up the logger
  L runLogging<L>(L Function() fn, [LogOptions options = const LogOptions()]);

  /// Stream of logs
  Stream<LogMessage> get logs;

  /// Handy method to log zoneError
  void logZoneError(Object error, StackTrace stackTrace) {
    this.error('Zone error: $error', error: error, stackTrace: stackTrace);
  }

  /// Handy method to log [FlutterError]
  void logFlutterError(FlutterErrorDetails details) {
    if (details.silent) {
      return;
    }

    final description = details.exceptionAsString();

    error(
      'Flutter Error: $description',
      error: details.exception,
      stackTrace: details.stack,
    );
  }

  /// Handy method to log [PlatformDispatcher] error
  bool logPlatformDispatcherError(Object error, StackTrace stackTrace) {
    this.error(
      'Platform Dispatcher Error: $error',
      error: error,
      stackTrace: stackTrace,
    );
    return true;
  }
}