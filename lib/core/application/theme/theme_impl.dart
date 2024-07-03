import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

final class ThemeImpl extends ThemeBase {
  final ThemeMode mode;
  ThemeImpl({
    required this.mode,
  });

  @override
  ThemeMode get themeMode => mode;
}
