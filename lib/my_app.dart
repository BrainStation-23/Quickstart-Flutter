import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qs_flutter/core/app_context.dart';
import 'package:qs_flutter/core/base/blocs/base_bloc.dart';
import 'package:qs_flutter/core/base/blocs/base_state.dart';
import 'package:qs_flutter/core/bloc/global_bloc_providers.dart';
import 'package:qs_flutter/core/localization.dart';
import 'package:qs_flutter/core/routes/route_generator.dart';
import 'package:qs_flutter/core/theme/color.schema.dart';
import 'package:qs_flutter/core/utils/transitions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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