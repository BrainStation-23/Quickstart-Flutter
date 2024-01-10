import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qs_flutter/flavors/build_config.dart';

enum AppStatus { initial, loading, failed, success }

class BaseState extends Equatable {
  final AppStatus? status;
  final ThemeMode? themeMode;
  final Locale? locale;

  const BaseState({this.status, this.locale, this.themeMode});

  BaseState.initial()
      : status = AppStatus.initial,
        themeMode = BuildConfig.instance.config.themeMode,
        locale = BuildConfig.instance.config.locale;

  BaseState copyWith(
      {AppStatus? appStatus, ThemeMode? themeMode, Locale? locale}) {
    return BaseState(
        status: status ?? status,
        themeMode: themeMode ?? this.themeMode,
        locale: locale ??this.locale);
  }

  @override
  List<Object?> get props => [status, themeMode, locale];
}
