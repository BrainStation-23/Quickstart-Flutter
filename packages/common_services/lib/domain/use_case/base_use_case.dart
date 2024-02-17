import 'package:dartz/dartz.dart';

abstract class BaseUseCase<TInput, TOutput, TError> {
  Future<Either<TOutput, TError>> call(TInput input);
}
