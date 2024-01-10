part of 'sign_in_bloc.dart';

class SignInEvent {
  const SignInEvent();
}

class EmailChangeEvent extends SignInEvent {
  const EmailChangeEvent({
    required this.email,
  });
  final String email;
}

class PasswordChangeEvent extends SignInEvent {
  const PasswordChangeEvent({
    required this.password,
  });
  final String password;
}

class PhoneNumberChangeEvent extends SignInEvent {
  const PhoneNumberChangeEvent({
    required this.phoneNumber,
  });
  final String phoneNumber;
}

class SignInSubmitted extends SignInEvent {}

