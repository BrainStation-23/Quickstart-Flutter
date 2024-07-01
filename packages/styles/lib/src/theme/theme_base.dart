import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:styles/src/theme/models/app_theme.dart';

///Please [extend] ThemeBase class to provide [seedColor] or [colorScheme].
///If you want to generate themeData from only one seed color then provide [seedColor], then you don't need to provide [colorScheme]
///Similarly if you want to have greater control in generating theme data then please provide [colorScheme] & don't provide [seedColor]
///[colorScheme] is basically used for the light theme.
/// if you want to have greater control on your dark theme then please provide [darkColorScheme].
/// if [darkColorScheme] is not given, then it will be generated from [colorScheme]

abstract class ThemeBase {
  Color? get seedColor => null;

  ColorScheme? get colorScheme => null;

  ColorScheme? get darkColorScheme => null;

  ThemeMode get themeMode;

  @nonVirtual
  AppTheme get appTheme {
    if (seedColor == null && colorScheme == null) {
      throw ArgumentError(
          "Please provide a seedColor or colorScheme to generate theme");
    }
    if (seedColor != null && colorScheme != null) {
      throw ArgumentError(
          "Can not provide seedColor & ColorScheme at the same time. If you want to generate theme from seedColor then do not provide colorScheme. Similarly do not provide seed color if you want to generate theme from colorScheme");
    }
    if (colorScheme != null) {
      return AppTheme(
          mode: themeMode,
          colorScheme: colorScheme!,
          darkColorScheme: darkColorScheme);
    }

    if (seedColor != null) {
      return AppTheme.fromSeed(mode: themeMode, seed: seedColor!);
    }

    throw ArgumentError(
        "Please provide a seed color or colorScheme to generate theme");
  }

  @nonVirtual
  ThemeData get themeData => appTheme.themeData;
}
