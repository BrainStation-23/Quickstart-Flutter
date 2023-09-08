import 'package:dartz/dartz.dart';

import '../entities/sign_up_entity.dart';
import '../repositories/sign_up_repositories.dart';

class SignUpUseCase {
  const SignUpUseCase({required this.signUpRepository});

  final SignUpRepository signUpRepository;

  Future<Either<String, SignUpEntity>> call({
    required Map<String, dynamic> requestBody,
  }) async {
    return await signUpRepository.signUp(
      requestBody: requestBody,
    );
  }
}
