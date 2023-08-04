import 'package:dartz/dartz.dart';
import 'package:qs_flutter/core/error/exceptions.dart';
import 'package:qs_flutter/core/error/failures.dart';
import 'package:qs_flutter/features/auth/data/datasources/auth_data_source.dart';
import 'package:qs_flutter/features/auth/data/models/auth_model.dart';
import 'package:qs_flutter/features/auth/domain/entities/auth.dart';
import 'package:qs_flutter/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, Auth>> getAuth() async {
    try {
      final auth = await dataSource.getAuth();
      return Right(auth);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> saveAuth(AuthModel auth) async {
    dataSource.saveAuth(auth);
  }
}
