import 'package:equatable/equatable.dart';

enum ForgotPasswordScreenStatus { initial, loading, success, failed, verify }

class ForgotPasswordState extends Equatable {
  final ForgotPasswordScreenStatus status;
  final String email;
  final String phoneNumber;
  final String otp;

  ForgotPasswordState(
      {required this.status,
      required this.email,
      required this.phoneNumber,
      required this.otp});

  ForgotPasswordState.initial()
      : status = ForgotPasswordScreenStatus.initial,
        email = '',
        phoneNumber = '',
        otp = '';

  @override
  List<Object?> get props => [status, email, phoneNumber, otp];
}
