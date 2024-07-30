import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:styles/src/theme/models/app_theme.dart';
import 'package:styles/src/theme/theme_generator/theme_generator_base.dart';

abstract class SeedColorThemeGenerator
    extends ThemeGeneratorBase<AppTheme, ThemeMode> {
  Color get seed;

  @override
  @nonVirtual
  AppTheme generateTheme() {
    return AppTheme.fromSeed(mode: themeMode, seed: seed);
  }
}
