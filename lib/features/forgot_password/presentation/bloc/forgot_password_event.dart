class ForgotPasswordEvent {}

class ForgotPasswordEmailChangeEvent extends ForgotPasswordEvent {
  final String? email;

  ForgotPasswordEmailChangeEvent({required this.email});
}
class ResetSubmitEvent extends ForgotPasswordEvent{

}
class NumberChangeEvent extends ForgotPasswordEvent {
  final String? phoneNumber;

  NumberChangeEvent({required this.phoneNumber});
}

class OTPChangeEvent extends ForgotPasswordEvent {
  final String? otp;

  OTPChangeEvent({required this.otp});
}
