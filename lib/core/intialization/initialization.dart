import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/env.dart';
import 'package:flutter_boilerplate/core/application/theme/theme_impl.dart';
import 'package:logger/logger.dart';
import 'package:styles/styles.dart';
import 'package:tracking_manager/tracking_manager.dart';

import 'models/app_storage.dart';

final class Initialization {
  final Env env;
  Initialization(this.env);

  Future<AppStorage> initialize() async {
    ThemeCubit themeCubit = await _initThemeCubit();
    ErrorTrackingManager errorTrackingManager =
        await _initErrorTrackingManager();
    return AppStorage(
        themeCubit: themeCubit, errorTrackingManager: errorTrackingManager);
  }

  Future<ErrorTrackingManager> _initErrorTrackingManager() async {
    final errorTrackingManager = SentryTrackingManager(
      logger,
      sentryDsn: env.sentryDsn,
      environment: env.envType.name,
    );

    if (env.enableSentry) {
      await errorTrackingManager.enableReporting();
    }

    return errorTrackingManager;
  }

  Future<ThemeCubit> _initThemeCubit() async {
    ///TODO:: handle initial theme mode;
    ThemeMode mode = ThemeMode.light;
    ThemeBase theme = ThemeImpl(mode: mode);
    final ThemeState initialState = ThemeIdleState(theme);
    ThemeCubit themeCubit = ThemeCubit(initialState);

    return themeCubit;
  }
}
