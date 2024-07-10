import 'package:flutter/cupertino.dart';

abstract class LocalizationBase<LocaleType, TranslationType> {
  void initializeLocalization(String languageCode);

  Widget localizationScope({required Widget child});

  Locale currentLocale(BuildContext context);

  List<Locale> get supportedLocale;

  List<LocalizationsDelegate<void>> get localizationsDelegates;

  void changeLocale(LocaleType locale);

  TranslationType text(BuildContext context);
}
