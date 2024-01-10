import 'package:dartz/dartz.dart';

import '../entities/sign_in_entity.dart';

abstract class SignInRepository {
  Future<Either<String, SignInEntity>> signIn({
    required Map<String, dynamic> requestBody,
  });
}
