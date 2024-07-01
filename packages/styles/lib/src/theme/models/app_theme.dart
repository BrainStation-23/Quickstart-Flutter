import 'dart:ui';

import 'package:flutter/material.dart';

final class AppTheme {
  final ThemeMode mode;
  final ColorScheme colorScheme;
  final ColorScheme? darkColorScheme;


  AppTheme({required this.mode, required this.colorScheme, this.darkColorScheme})
      : darkTheme = ThemeData(
          colorScheme:darkColorScheme?? colorScheme,
          brightness: Brightness.dark,
        ),
        lightTheme =
            ThemeData(colorScheme: colorScheme, brightness: Brightness.light);

  final ThemeData darkTheme;
  final ThemeData lightTheme;

  factory AppTheme.fromSeed({required ThemeMode mode, required Color seed}) {
    ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: seed);
    return AppTheme(mode: mode, colorScheme: colorScheme);
  }

  ThemeData get themeData => _computeTheme();

  ThemeData _computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark
            ? darkTheme
            : lightTheme;
    }
  }
}
