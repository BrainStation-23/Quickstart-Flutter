import 'package:qs_flutter/core/error/failures.dart';
import 'package:qs_flutter/features/auth/data/models/auth_model.dart';
import 'package:qs_flutter/features/auth/domain/entities/auth.dart';
import "package:dartz/dartz.dart";

abstract class AuthRepository {
  Future<Either<Failure, Auth>> getAuth();
  Future<void> saveAuth(AuthModel auth);
}
