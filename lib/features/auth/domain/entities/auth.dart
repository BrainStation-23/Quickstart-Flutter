import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final bool loggedIn;

  const Auth({required this.loggedIn});

  @override
  List<Object?> get props => [loggedIn];
}
