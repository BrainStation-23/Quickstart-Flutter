part of api_base;

abstract class ApiBase<TRequest extends ApiRequest,
    TResponse extends ApiResponse, TError extends ApiResponse> {
  ApiBase();

  Future<Either<TResponse, TError>> get(TRequest request);

  Future<Either<TResponse, TError>> post(TRequest request);

  Future<Either<TResponse, TError>> patch(TRequest request);

  Future<Either<TResponse, TError>> put(TRequest request);

  Future<Either<TResponse, TError>> delete(TRequest request);

  Map<String, String> get headers => {};

  TResponse mapResponse(Map<String, dynamic> json);
  TError mapError({String? message, Map<String, dynamic>? json});
}
