import '../../domain/entities/forgot_password_entity.dart';

class ForgotPasswordModel extends ForgotPasswordEntity {
  const ForgotPasswordModel({
    required String message,
  }) : super(
          message: message,
        );

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModel(message: json['message'] ?? "");
  }
}
