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
                  ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
              darkTheme:
                  ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
              routerConfig: RouteGenerator.router,
            );
          },
        ));
  }
}

class DummyHome extends StatelessWidget {
  late AppLocalizations? _appLocalizations;

  DummyHome({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);
    return BlocBuilder<BaseBloc, BaseState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_appLocalizations?.logIn ?? ""),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextField(
                    controller: _textEditingController,
                    obscureText: true,
                    labelText: 'Email',
                    onChanged: (value) {},
                  ),
                ),
                TextButton(
                    onPressed: () {
                      context
                          .read<BaseBloc>()
                          .add(ChangeLanguageEvent(locale: Locale('en')));
                      context.read<BaseBloc>().add(ChangeLanguageEvent(
                          locale: state.locale == const Locale('en')
                              ? const Locale('bn')
                              : const Locale('en')));
                    },
                    child: const Text("Change Language"))
              ],
            ),
          ),
        );
      },
    );
  }
}
