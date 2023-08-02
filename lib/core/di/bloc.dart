part of 'injection_container.dart';

Future<void> _initBlocs() async {
  sl.registerFactory(
    () => BaseBloc<BaseEvent, BaseState>(
        const BaseState(themeMode: ThemeMode.system, locale: Locale('bn'))),
  );
}
