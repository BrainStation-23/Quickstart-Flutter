import 'package:flutter/material.dart';

class BaseEvent{
  const BaseEvent();
}

class SuccessEvent extends BaseEvent {}

class FailedEvent extends BaseEvent {}

class LoadingEvent extends BaseEvent {}

class ChangeLanguageEvent extends BaseEvent{
  final Locale? locale;

  ChangeLanguageEvent({this.locale});
}

class ChangeThemeEvent extends BaseEvent{
  final ThemeMode? themeMode;

  ChangeThemeEvent({this.themeMode});
}
