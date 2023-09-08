part of 'sign_in_bloc.dart';

enum SignInStatus { initial, success, failure, loading }

class SignInState extends Equatable {
  final SignInStatus status;
  final String email;
  final String password;
  final String fcmToken;
  final String phoneNumber;
  final String errorMessage;

  const SignInState({
    this.status = SignInStatus.initial,
    this.email = '',
    this.password = '',
    this.fcmToken = '',
    this.phoneNumber = '',
    this.errorMessage = '',
  });

  const SignInState.initial()
      : status = SignInStatus.initial,
        email = '',
        password = '',
        fcmToken = '',
        phoneNumber = '',
        errorMessage = '';

  SignInState copyWith({
    SignInStatus? status,
    String? email,
    String? password,
    String? fcmToken,
    String? phoneNumber,
    String? errorMessage,
  }) {
    return SignInState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      fcmToken: fcmToken ?? this.fcmToken,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        fcmToken,
        phoneNumber,
        errorMessage,
      ];
}
