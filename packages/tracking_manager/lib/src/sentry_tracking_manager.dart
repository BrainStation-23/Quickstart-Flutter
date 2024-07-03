part of '../tracking_manager.dart';

final class SentryTrackingManager extends ErrorTrackingManagerBase {
  SentryTrackingManager(
    super._logger, {
    required this.sentryDsn,
    required this.environment,
  });

  /// The Sentry DSN.
  final String sentryDsn;

  /// The Sentry environment.
  final String environment;

  @override
  Future<void> _report(LogMessage log) async {
    final error = log.error;
    final stackTrace = log.stackTrace;

    if (error == null && stackTrace == null) {
      await Sentry.captureMessage(log.message.toString());
      return;
    }

    await Sentry.captureException(error ?? log.message, stackTrace: stackTrace);
  }

  @override
  Future<void> enableReporting() async {
    await SentryFlutter.init((options) {
      options.dsn = sentryDsn;

      // Set the sample rate to 20% of events.
      options.tracesSampleRate = 0.20;
      options.debug = kDebugMode;
      options.environment = environment;
    });
    await super.enableReporting();
  }

  @override
  Future<void> disableReporting() async {
    await Sentry.close();
    await super.disableReporting();
  }
}
