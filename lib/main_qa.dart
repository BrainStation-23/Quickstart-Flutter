import 'package:flutter/material.dart';

import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'main_prod.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "QA",
    baseUrl: "xyz",
  );

  BuildConfig.instantiate(
    envType: Environment.QA,
    envConfig: devConfig,
  );

  runApp(MyApp());
}
