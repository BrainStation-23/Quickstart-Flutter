part of logger;

final LoggerBase logger = Logger();

final class Logger extends LoggerBase {
  final _logger = logging.Logger('BS_QUICKSTART_FLUTTER');

  @override
  void debug(Object message) => _logger.fine(message);

  @override
  void error(Object message, {Object? error, StackTrace? stackTrace}) =>
      _logger.severe(message, error, stackTrace);

  @override
  void info(Object message) => _logger.info(message);

  @override
  void verbose(Object message) => _logger.finest(message);

  @override
  void warning(Object message) => _logger.warning(message);

  @override
  Stream<LogMessage> get logs => _logger.onRecord.map(
        (record) => record.toLogMessage(),
  );

  @override
  L runLogging<L>(L Function() fn, [LogOptions options = const LogOptions()]) {
    if (kReleaseMode && !options.logInRelease) {
      return fn();
    }
    logging.hierarchicalLoggingEnabled = true;

    _logger.onRecord
        .where((event) => event.loggerName == 'BS_QUICKSTART_FLUTTER')
        .listen((event) {
      final logMessage = event.toLogMessage();
      final message = options.formatter?.call(logMessage, options) ??
          _formatLoggerMessage(log: logMessage, options: options);

      if (logMessage.logLevel.compareTo(options.level) < 0) {
        return;
      }

      Zone.current.print(message);
    });

    return fn();
  }


  String _formatLoggerMessage({
    required LogMessage log,
    required LogOptions options,
  }) {
    final buffer = StringBuffer();
    if (options.showEmoji) {
      buffer.write(log.logLevel.emoji);
      buffer.write(' ');
    }
    if (options.showTime) {
      buffer.write(log.time?.formatTime());
      buffer.write(' | ');
    }
    buffer.write(log.message);
    if (log.error != null) {
      buffer.writeln();
      buffer.write(log.error);
    }
    if (log.stackTrace != null) {
      buffer.writeln();
      buffer.write(log.stackTrace);
    }

    return buffer.toString();
  }
}