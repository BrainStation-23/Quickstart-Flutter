part of api_base;

abstract class ApiBase<TRequest extends ApiRequest,
    TResponse extends ApiResponse, TError extends ApiErrorResponse> {
  ApiBase();

  Future<Either<TResponse, TError>> get(TRequest request,
      {Map<String, String>? headers});

  Future<Either<TResponse, TError>> post(TRequest request,
      {Map<String, String>? headers});

  Future<Either<TResponse, TError>> patch(TRequest request,
      {Map<String, String>? headers});

  Future<Either<TResponse, TError>> put(TRequest request,
      {Map<String, String>? headers});

  Future<Either<TResponse, TError>> delete(TRequest request,
      {Map<String, String>? headers});

  TResponse mapResponse(Map<String, dynamic> json);
  TError mapError({Map<String, dynamic>? json});
}
