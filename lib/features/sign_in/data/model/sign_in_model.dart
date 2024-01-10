import '../../domain/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  SignInModel({
    required String token,
  }) : super(token: token);

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        token: json['token'],
      );
}
