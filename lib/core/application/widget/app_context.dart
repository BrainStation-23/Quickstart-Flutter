import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/application/theme/theme_impl.dart';
import 'package:styles/styles.dart';

import '../../../navigations/route_generator.dart';
import '../../intialization/models/app_storage.dart';

class AppContext extends StatelessWidget {
  const AppContext({super.key});

  // This global key is needed for [MaterialApp]
  // to work properly when Widgets Inspector is enabled.
  static final _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final ThemeImpl theme = ThemeScope.of<ThemeImpl>(context);
    AppTheme appTheme = theme.generateTheme();
    final AppStorage appStorage = RepositoryProvider.of(context);
    return MaterialApp.router(
      theme: appTheme.themeData,
      themeMode: theme.themeMode,
      routerConfig: RouteGenerator.router,
      locale: appStorage.localization.currentLocale(context),
      supportedLocales: appStorage.localization.supportedLocale,
      localizationsDelegates: appStorage.localization.localizationsDelegates,
      // TODO: You may want to override the default text scaling behavior.
      builder: (context, child) => MediaQuery.withClampedTextScaling(
        key: _globalKey,
        minScaleFactor: 1.0,
        maxScaleFactor: 2.0,
        child: child!,
      ),
    );
  }
}
