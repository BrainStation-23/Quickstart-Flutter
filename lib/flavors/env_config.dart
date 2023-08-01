import 'package:logger/logger.dart';

import '../core/values/app_values.dart';


class EnvConfig {
  final String appName;
  final String baseUrl;

  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
          methodCount: AppValues.loggerMethodCount,
          // number of method calls to be displayed
          errorMethodCount: AppValues.loggerErrorMethodCount,
          // number of method calls if stacktrace is provided
          lineLength: AppValues.loggerLineLength,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }
}
