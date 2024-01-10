import 'package:dartz/dartz.dart';

import '../entities/sign_up_entity.dart';

abstract class SignUpRepository {
  Future<Either<String, SignUpEntity>> signUp({
    required Map<String, dynamic> requestBody,
  });
  Future<Either<String, SignUpEntity>> verifyOTP({
    required Map<String, dynamic> requestBody,
  });
}
