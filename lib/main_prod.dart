import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'core/bloc/bloc_observer.dart';
import 'core/bloc/global_bloc_providers.dart';
import 'core/di/injection_container.dart' as di;
import 'core/localization.dart';
import 'core/theme/color.schema.dart';
import 'core/utils/transitions.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'my_app.dart';

void main() async {
  EnvConfig prodConfig = EnvConfig(
    appName: "Production",
    baseUrl: "xyz",
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );
  Bloc.observer = GlobalBlocObserver();
  await di.init();

  runApp(const MyApp());
}



