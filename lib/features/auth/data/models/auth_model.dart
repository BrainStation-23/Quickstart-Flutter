import 'package:qs_flutter/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({required super.loggedIn});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(loggedIn: json['loggedIn']);
  }

  Map<String, dynamic> toJson() {
    return {'loggedIn': loggedIn};
  }

  Auth toAuth() {
    return Auth(loggedIn: loggedIn);
  }
}
