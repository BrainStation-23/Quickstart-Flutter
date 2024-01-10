import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qs_flutter/core/services/local_storage/cache_service.dart';

import 'base_event.dart';
import 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc(super.initialState) {
    on<ChangeThemeEvent>(_changeThemeState);
    on<ChangeLanguageEvent>(_changeLanguageState);
  }


  FutureOr<void> _changeThemeState(ChangeThemeEvent event, Emitter<BaseState> emit) {
    emit((state.copyWith(themeMode: event.themeMode)));
    CacheService.instance.changeTheme(event.themeMode??ThemeMode.light);
  }

  FutureOr<void> _changeLanguageState(ChangeLanguageEvent event, Emitter<BaseState> emit) {
    emit((state.copyWith(locale: event.locale)));
    CacheService.instance.changeLanguage(event.locale == const Locale('en')?'en':'bn');
  }
}
