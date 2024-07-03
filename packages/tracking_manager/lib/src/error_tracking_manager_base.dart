part of '../tracking_manager.dart';


abstract base class ErrorTrackingManagerBase implements ErrorTrackingManager {
  ErrorTrackingManagerBase(this._logger);

  final LoggerBase _logger;
  StreamSubscription<LogMessage>? _subscription;

  /// Catch only warnings and errors
  Stream<LogMessage> get _reportLogs => _logger.logs.where(_isWarningOrError);

  static bool _isWarningOrError(LogMessage log) =>
      log.logLevel.compareTo(LoggerLevel.warning) >= 0;

  @mustCallSuper
  @mustBeOverridden
  @override
  Future<void> disableReporting() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  @mustCallSuper
  @mustBeOverridden
  @override
  Future<void> enableReporting() async {
    _subscription ??= _reportLogs.listen((log) async {
      if (_shouldReport(log.error)) {
        await _report(log);
      }
    });
  }

  /// Returns `true` if the error should be reported.
  @pragma('vm:prefer-inline')
  bool _shouldReport(Object? error) => true;

  /// This method is called when a log message is received.
  Future<void> _report(LogMessage log);
}