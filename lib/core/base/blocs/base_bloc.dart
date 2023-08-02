import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_event.dart';
import 'base_state.dart';

class BaseBloc<E extends BaseEvent, S extends BaseState> extends Bloc<E, S> {
  BaseBloc(super.initialState) {
    on<E>(_changeState);
  }

  FutureOr<void> _changeState(BaseEvent event, Emitter<BaseState> emit) {
    if (event is ChangeThemeEvent) {
      emit((state.copyWith(themeMode: event.themeMode)));
    } else if (event is ChangeLanguageEvent) {
      emit((state.copyWith(locale: event.locale)));
    }
  }
}
