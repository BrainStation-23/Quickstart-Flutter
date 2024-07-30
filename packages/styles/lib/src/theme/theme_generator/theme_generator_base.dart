
///[ThemeGeneratorBase] is the base class for generating all kinds of theme.
///[ThemeGeneratorBase] has two generic data type
///[MThemeData] provides a specific theme data that to be generated.
///[MThemeData] can be Material ThemeData or any kind of custom theme data
///[MThemeMode] provides the specific theme modes.
///[MThemeMode] can be Material theme mode or any kinds of custom theme mode

abstract class ThemeGeneratorBase<MThemeData, MThemeMode>{
  MThemeData generateTheme();
  MThemeMode get themeMode;
}