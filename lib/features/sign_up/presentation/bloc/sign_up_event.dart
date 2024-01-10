part of 'sign_up_bloc.dart';

class SignUpEvent {
  const SignUpEvent();
}

class FirstNameChangeEvent extends SignUpEvent {
  const FirstNameChangeEvent({
    required this.firstName,
  });

  final String firstName;
}

class LastNameChangeEvent extends SignUpEvent {
  const LastNameChangeEvent({
    required this.lastName,
  });

  final String lastName;
}

class EmailChangeEvent extends SignUpEvent {
  const EmailChangeEvent({
    required this.email,
  });

  final String email;
}

class BirthDateChangeEvent extends SignUpEvent {
  const BirthDateChangeEvent({
    required this.birthdate,
  });

  final String birthdate;
}

class PasswordChangeEvent extends SignUpEvent {
  const PasswordChangeEvent({
    required this.password,
  });

  final String password;
}

class PhoneNumberChangeEvent extends SignUpEvent {
  const PhoneNumberChangeEvent({
    required this.phoneNumber,
  });

  final String phoneNumber;
}

class OTPChangeEvent extends SignUpEvent {
  const OTPChangeEvent({
    required this.otp,
  });

  final String otp;
}

class SignUpValidateAgeEvent extends SignUpEvent {
  const SignUpValidateAgeEvent({
    required this.isValidAge,
  });

  final bool isValidAge;
}

class SignUpSubmitted extends SignUpEvent {}

class VerifyOTPEvent extends SignUpEvent {}

class SignUpStatusChange extends SignUpEvent {}
