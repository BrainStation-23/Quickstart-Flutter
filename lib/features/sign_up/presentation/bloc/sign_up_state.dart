part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, success, failure, loading, verify_otp }

class SignUpState extends Equatable {
  final SignUpStatus status;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String birthdate;
  final String errorMessage;
  final String responseMessage;
  final bool isAgeValidate;
  final String otp;

  const SignUpState(
      {this.status = SignUpStatus.initial,
      this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.password = '',
      this.birthdate = '',
      this.phoneNumber = '',
      this.errorMessage = '',
      this.responseMessage = '',
      this.isAgeValidate = true,
      this.otp = ''});

  const SignUpState.initial()
      : status = SignUpStatus.initial,
        firstName = '',
        lastName = '',
        email = '',
        password = '',
        phoneNumber = '',
        birthdate = '',
        errorMessage = '',
        responseMessage = '',
        isAgeValidate = true,
        otp = '';

  SignUpState copyWith(
      {SignUpStatus? status,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? phoneNumber,
      String? birthdate,
      bool? isAgeValidate = true,
      String? errorMessage,
      String? responseMessage,
      String? otp}) {
    return SignUpState(
        status: status ?? this.status,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        birthdate: birthdate ?? this.birthdate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        isAgeValidate: isAgeValidate ?? this.isAgeValidate,
        errorMessage: errorMessage ?? this.errorMessage,
        responseMessage: responseMessage ?? this.responseMessage,
        otp: otp ?? this.otp);
  }

  @override
  List<Object?> get props => [
        status,
        firstName,
        lastName,
        email,
        password,
        birthdate,
        phoneNumber,
        errorMessage,
        responseMessage,
        otp
      ];
}
