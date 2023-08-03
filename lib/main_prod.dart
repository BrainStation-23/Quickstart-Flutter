import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qs_flutter/core/app_context.dart';
import 'package:qs_flutter/core/base/blocs/base_bloc.dart';
import 'package:qs_flutter/core/base/blocs/base_event.dart';
import 'package:qs_flutter/core/base/blocs/base_state.dart';
import 'package:qs_flutter/core/base/widgets/AppTextField.dart';
import 'package:qs_flutter/core/routes/route_generator.dart';

import 'core/bloc/bloc_observer.dart';
import 'core/bloc/global_bloc_providers.dart';
import 'core/di/injection_container.dart' as di;
import 'core/localization.dart';
import 'core/theme/color.schema.dart';
import 'core/utils/transitions.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppContext.instantiate(context: context);
    return MultiBlocProvider(
        providers: GlobalBlocProviders().providers,
        child: BlocBuilder<BaseBloc, BaseState>(
          builder: (context, state) {
            return MaterialApp.router(
              supportedLocales: getSupportedLocal(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              themeMode: state.themeMode,
              theme:
                  ThemeData(useMaterial3: true, colorScheme: lightColorScheme,
                    pageTransitionsTheme: pageTransitionsTheme),
              darkTheme:
                  ThemeData(useMaterial3: true, colorScheme: darkColorScheme,
                    pageTransitionsTheme: pageTransitionsTheme),
              routerConfig: RouteGenerator.router,
            );
          },
        ));
  }
}

