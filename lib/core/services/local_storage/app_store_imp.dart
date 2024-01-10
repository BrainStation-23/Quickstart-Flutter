import 'package:flutter/src/material/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_store.dart';

class AppStorageImp extends AppStorageI {
  static Future<SharedPreferences> getPrefs() async {
    return SharedPreferences.getInstance();
  }

  static const String _keyBearerToken = 'bearer_token';
  static const String _keyUserEmail = 'user_email';
  static const String _keyPassword = 'password';
  static const String _keyFcmToken = 'fcm-token';
  static const String _keyTheme = 'theme';
  static const String _keyLanguage = 'language';

  @override
  Future<void> storeBearerToken(String token) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString(_keyBearerToken, token);
  }

  @override
  Future<String?> retrieveBearerToken() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString(_keyBearerToken);
  }

  @override
  Future<Map<String, dynamic>?> retrieveCredentials() async {
    SharedPreferences prefs = await getPrefs();
    String? userEmail = prefs.getString(_keyUserEmail);
    String? password = prefs.getString(_keyPassword);

    if (userEmail != null && password != null) {
      return {'userEmail': userEmail, 'password': password};
    }

    return null;
  }

  @override
  Future<void> storeCredentials(Map<String, dynamic> credentials) async {
    SharedPreferences prefs = await getPrefs();

    String userEmail = credentials['userEmail'];
    String password = credentials['password'];

    prefs.setString(_keyUserEmail, userEmail);
    prefs.setString(_keyPassword, password);
  }

  @override
  Future<void> clearToken() async {
    SharedPreferences prefs = await getPrefs();
    prefs.remove(_keyBearerToken);
  }

  @override
  Future<void> clearCredentials() async {
    SharedPreferences prefs = await getPrefs();

    prefs.remove(_keyUserEmail);
    prefs.remove(_keyPassword);
  }

  @override
  Future<void> storeFcmToken(String token) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString(_keyFcmToken, token);
  }

  @override
  Future<String?> retrieveFcmToken() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString(_keyFcmToken);
  }

  @override
  Future<void> changeLanguage(String languageType) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString(_keyLanguage, languageType);
  }

  @override
  Future<void> changeTheme(ThemeMode themeMode) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString(_keyTheme, themeMode.name);
  }

  @override
  Future<String?> retrieveLanguage() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString(_keyLanguage);
  }

  @override
  Future<String?> retrieveTheme() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString(_keyTheme);
  }
}
