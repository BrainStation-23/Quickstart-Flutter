import 'dart:convert';

import 'package:qs_flutter/features/auth/data/models/auth_model.dart';
import 'package:qs_flutter/features/auth/domain/entities/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String authSharedPreferencesKey = "CACHED_AUTH";

abstract class AuthDataSource {
  Future<Auth> getAuth();
  Future<void> saveAuth(AuthModel auth);
}

class AuthDataSourceImpl implements AuthDataSource {
  final SharedPreferences sharedPreferences;

  AuthDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Auth> getAuth() {
    try {
      final jsonString = sharedPreferences.getString(authSharedPreferencesKey);
      if (jsonString != null) {
        return Future.value(AuthModel.fromJson(json.decode(jsonString)));
      } else {
        //! WE ARE CONSIDERING USER IS NOT AUTHENTICATED AND RETURNING DEFAULT RESPONSE
        return Future.value(const AuthModel(loggedIn: false));
      }
    } on Exception {
      //! TODO: Implement the logic what should do in this case
      // throw CacheException();
      //! WE ARE CONSIDERING USER IS NOT AUTHENTICATED AND RETURNING DEFAULT RESPONSE
      return Future.value(const AuthModel(loggedIn: false));
    }
  }

  @override
  Future<void> saveAuth(AuthModel auth) {
    auth.toAuth();
    return sharedPreferences.setString(
        authSharedPreferencesKey, json.encode(auth.toJson()));
  }
}
