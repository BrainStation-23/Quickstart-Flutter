import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

import '../../../navigations/route_generator.dart';

class AppContext extends StatelessWidget {
  const AppContext({super.key});

  // This global key is needed for [MaterialApp]
  // to work properly when Widgets Inspector is enabled.
  static final _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final ThemeBase theme = ThemeScope.of(context);
    return MaterialApp.router(
      theme: theme.themeData,
      themeMode: theme.themeMode,
      routerConfig: RouteGenerator.router,
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
