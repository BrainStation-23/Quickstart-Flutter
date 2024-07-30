
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:styles/src/theme/models/app_theme.dart';
import 'package:styles/src/theme/theme_generator/theme_generator_base.dart';

abstract class ColorSchemeThemeGenerator implements ThemeGeneratorBase<AppTheme, ThemeMode>{
  ColorScheme get colorScheme;

  @override
  @nonVirtual
  AppTheme generateTheme() {
    return AppTheme(mode: themeMode, colorScheme: colorScheme);
  }
}