part of 'auth_bloc.dart';

const String loggedInKey = "loggedInKey";

abstract class AuthState extends Equatable {
  AuthState(this.sharedPreferences) {
    loggedIn = sharedPreferences.getBool(loggedInKey) ?? false;
  }

  final SharedPreferences sharedPreferences;
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;
  set loggedIn(bool value) {
    _loggedIn = value;
    sharedPreferences.setBool(loggedInKey, value);
  }

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  AuthInitial(super.sharedPreferences);
}
