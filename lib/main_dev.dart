import 'package:flutter/material.dart';

import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'main_prod.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "Development",
    baseUrl: "xyz",
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp( MyApp());
}
