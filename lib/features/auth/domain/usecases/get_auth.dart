import 'package:dartz/dartz.dart';
import 'package:qs_flutter/core/error/failures.dart';
import 'package:qs_flutter/core/usecases/usecase.dart';
import 'package:qs_flutter/features/auth/domain/entities/auth.dart';
import 'package:qs_flutter/features/auth/domain/repositories/auth_repository.dart';

class GetAuth implements UseCase<Auth, NoParams> {
  final AuthRepository repository;

  GetAuth(this.repository);

  @override
  Future<Either<Failure, Auth>> call(NoParams params) {
    return repository.getAuth();
  }
}
