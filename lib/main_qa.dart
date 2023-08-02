import 'package:flutter/material.dart';

import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'main_prod.dart';

void main() {
  EnvConfig qaConfig = EnvConfig(
    appName: "QA",
    baseUrl: "xyz",
  );

  BuildConfig.instantiate(
    envType: Environment.QA,
    envConfig: qaConfig,
  );

  runApp(MyApp());
}
