import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styles/src/theme/bloc/theme_state.dart';
import 'package:styles/src/theme/theme_base.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeState initialState;
  ThemeCubit(this.initialState) : super(initialState);

  void updateTheme(ThemeBase theme) {
    emit(ThemeIdleState(theme));
  }
}
