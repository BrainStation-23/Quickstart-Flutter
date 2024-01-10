import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/logger.dart';
import '../../domain/entities/sign_in_entity.dart';
import '../../domain/repositories/sign_in_repositories.dart';
import '../datasource/sign_in_datasource.dart';
import '../model/sign_in_model.dart';

class SignInRepoImp implements SignInRepository {
  const SignInRepoImp({required this.signInRemoteDataSource});

  final SignInDataSource signInRemoteDataSource;

  @override
  Future<Either<String, SignInEntity>> signIn({
    required Map<String, dynamic> requestBody,
  }) async {
    try {
      final Response response =
          await signInRemoteDataSource.signIn(requestBody: requestBody);

      SignInEntity entity = SignInModel.fromJson(response.data['data']);

      return Right(entity);
    } catch (e, stackTrace) {
      Log.info(e.toString());
      Log.info(stackTrace.toString());
      return Left(e.toString());
    }
  }
}
