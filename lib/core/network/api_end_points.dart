class ApiEndPoints {
  /// Authentication
  static const String signIn = '/user-auth/sign-in';
  static const String signUp = '/user-auth/signup/send-otp';
  static const String verifyOtp = '/user-auth/signup/verify-otp';
  static const String addAddress = '/user/add-address';
  static const String resendOtp = '/auth/resend-otp';
  static const String forgotPassword = '/auth/forget-password';
  static const String setNewPassword = '/auth/set-new-password';
  static const String changePassword = '/users/change-password';
  static const String identityVerification = '/users/identity_verification';
  static const String updateProfile = '/users/profile/update';
  static const String user = '/users/';
  static const String singleUser = '/user/';
}
