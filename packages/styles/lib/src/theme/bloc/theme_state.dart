
import 'package:styles/src/theme/theme_generator/theme_generator_base.dart';

abstract class ThemeState<T extends ThemeGeneratorBase>{
  final T themeGenerator;
  ThemeState(this.themeGenerator);
}

class ThemeIdleState extends ThemeState{
  ThemeIdleState(super.theme);
}