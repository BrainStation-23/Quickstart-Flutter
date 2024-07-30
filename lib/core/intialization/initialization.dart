import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/env.dart';
import 'package:flutter_boilerplate/core/application/theme/theme_impl.dart';
import 'package:localization/localization.dart';
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
    LocalizationBase localization = await _initLocalization();
    return AppStorage(
      themeCubit: themeCubit,
      errorTrackingManager: errorTrackingManager,
      localization: localization,
    );
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
    ///TODO:: handle initial/saved theme mode;

    ThemeImpl theme = ThemeImpl();
    final ThemeState initialState = ThemeIdleState(theme);
    ThemeCubit themeCubit = ThemeCubit(initialState);

    return themeCubit;
  }

  Future<LocalizationBase> _initLocalization() async {
    //TODO:: handle initial/saved locale
    String initialLanguageCode = "en";
    LocalizationBase localization = SlangLocalizationImpl(initialLanguageCode);

    return localization;
  }
}
