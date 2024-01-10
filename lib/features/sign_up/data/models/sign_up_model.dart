

import '../../domain/entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel({
    required String message,
  }) : super(message: message);

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        message: json.values.first.toString(),
      );
}
