import 'package:styles/src/theme/theme_base.dart';

abstract class ThemeState{
  final ThemeBase themeBase;
  ThemeState(this.themeBase);
}

class ThemeIdleState extends ThemeState{
  ThemeIdleState(super.theme);
}