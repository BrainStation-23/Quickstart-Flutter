import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AppStatus { initial, loading, failed, success }

class BaseState extends Equatable {
  final AppStatus? status;
  final ThemeMode? themeMode;
  final Locale? locale;

  const BaseState({this.status, this.locale, this.themeMode});

  BaseState copyWith(
      {AppStatus? appStatus, ThemeMode? themeMode, Locale? locale}) {
    return BaseState(
        status: status ?? status,
        themeMode: themeMode ?? themeMode,
        locale: locale ?? locale);
  }

  @override
  List<Object?> get props => [status, themeMode, locale];
}
