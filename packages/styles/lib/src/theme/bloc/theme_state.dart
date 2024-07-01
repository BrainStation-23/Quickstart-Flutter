import 'package:styles/src/theme/theme_base.dart';

abstract class ThemeState{}

class ThemeIdleState extends ThemeState{
  final ThemeBase theme;
  ThemeIdleState(this.theme);
}

// class ThemeProcessingState extends ThemeState{
//   final AppTheme theme;
//   ThemeProcessingState(this.theme);
// }
