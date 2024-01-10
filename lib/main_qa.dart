import 'package:flutter/material.dart';

import 'core/services/local_storage/cache_service.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'my_app.dart';

Future<void> main() async {
  final themeMode = await CacheService.instance.retrieveTheme();
  final local = await CacheService.instance.retrieveLanguage();
  EnvConfig qaConfig = EnvConfig(
    appName: "QA",
    baseUrl: "xyz",
      themeMode: themeMode == 'light' ? ThemeMode.light : ThemeMode.dark,
      locale: local == 'en' ? const Locale('en') : const Locale('bn')
  );

  BuildConfig.instantiate(
    envType: Environment.QA,
    envConfig: qaConfig,
  );

  runApp(const MyApp());
}
