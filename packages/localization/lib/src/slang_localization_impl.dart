import 'package:flutter/material.dart';
import 'package:localization/src/localization_base.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../i18n/strings.g.dart';

final class SlangLocalizationImpl
    extends LocalizationBase<AppLocale, Translations> {
  final String initialLanguageCode;

  SlangLocalizationImpl(this.initialLanguageCode) {
    initializeLocalization(initialLanguageCode);
  }

  @override
  void initializeLocalization(String languageCode) {
    LocaleSettings.setLocaleRaw(languageCode);
  }

  @override
  Widget localizationScope({required Widget child}) {
    return TranslationProvider(child: child);
  }

  @override
  Locale currentLocale(BuildContext context) {
    return TranslationProvider.of(context).flutterLocale;
  }

  @override
  List<Locale> get supportedLocale => AppLocaleUtils.supportedLocales;

  @override
  List<LocalizationsDelegate<void>> get localizationsDelegates =>
      GlobalMaterialLocalizations.delegates;

  @override
  void changeLocale(AppLocale locale) {
    LocaleSettings.setLocale(locale);
  }

  @override
  Translations text(BuildContext context) {
    return Translations.of(context);
  }
}
