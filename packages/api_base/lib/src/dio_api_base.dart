part of api_base;

//Dio implementation of API base
abstract class DioApiBase<TRequest extends ApiRequest,
        TResponse extends ApiResponse, TError extends ApiErrorResponse>
    extends ApiBase<TRequest, TResponse, TError> {
  final String url;
  final DioApiProvider dioApiProvider;

  DioApiBase(this.url, this.dioApiProvider);

  bool get notifyApiCallStarted => false;
  bool get notifyApiCallCompleted => false;
  bool get notifyApiCallError => false;

  @override
  Future<Either<TResponse, TError>> get(TRequest request,
      {Map<String, String>? headers}) async {
    try {
      Map<String, dynamic> requestBody = request.toJson();
      Options options = Options(headers: headers ?? {});
      _updateExtraOptions(options);

      Response<Map<String, dynamic>> response = await dioApiProvider.dio.get(
        url,
        options: options,
        queryParameters: requestBody,
      );

      return Left(mapResponse(response.data ?? {}));
    } on DioException catch (error) {
      return Right(_handleDioError(error));
    } catch (error) {
      return Right(mapError());
    }
  }

  @override
  Future<Either<TResponse, TError>> post(TRequest request,
      {Map<String, String>? headers}) async {
    try {
      String requestBody = request.toString();
      Options options = Options(headers: headers ?? {});
      _updateExtraOptions(options);

      Response<Map<String, dynamic>> response = await dioApiProvider.dio.post(
        url,
        data: requestBody,
        options: options,
      );

      return Left(mapResponse(response.data ?? {}));
    } on DioException catch (error) {
      return Right(_handleDioError(error));
    } catch (error) {
      return Right(mapError());
    }
  }

  @override
  Future<Either<TResponse, TError>> patch(TRequest request,
      {Map<String, String>? headers}) async {
    try {
      String requestBody = request.toString();
      Options options = Options(headers: headers ?? {});
      _updateExtraOptions(options);

      Response<Map<String, dynamic>> response = await dioApiProvider.dio.patch(
        url,
        data: requestBody,
        options: options,
      );

      return Left(mapResponse(response.data ?? {}));
    } on DioException catch (error) {
      return Right(_handleDioError(error));
    } catch (error) {
      return Right(mapError());
    }
  }

  @override
  Future<Either<TResponse, TError>> put(TRequest request,
      {Map<String, String>? headers}) async {
    try {
      String requestBody = request.toString();
      Options options = Options(headers: headers ?? {});
      _updateExtraOptions(options);

      Response<Map<String, dynamic>> response = await dioApiProvider.dio.put(
        url,
        data: requestBody,
        options: options,
      );

      return Left(mapResponse(response.data ?? {}));
    } on DioException catch (error) {
      return Right(_handleDioError(error));
    } catch (error) {
      return Right(mapError());
    }
  }

  @override
  Future<Either<TResponse, TError>> delete(TRequest request,
      {Map<String, String>? headers}) async {
    try {
      String requestBody = request.toString();
      Options options = Options(headers: headers ?? {});
      _updateExtraOptions(options);

      Response<Map<String, dynamic>> response = await dioApiProvider.dio.delete(
        url,
        data: requestBody,
        options: options,
      );

      return Left(mapResponse(response.data ?? {}));
    } on DioException catch (error) {
      return Right(_handleDioError(error));
    } catch (error) {
      return Right(mapError());
    }
  }

  TError _handleDioError(DioException exception) {
    if (exception.response?.data is Map<String, dynamic>) {
      return mapError(json: exception.response!.data);
    } else {
      return mapError()
        ..setProperties(
            code: exception.response?.statusCode.toString(),
            message: exception.response?.statusMessage);
    }
  }

  void _updateExtraOptions(Options options) {
    Map<String, dynamic> extraOptions = {
      DioApiProvider.notifyStartedKey: !notifyApiCallStarted,
      DioApiProvider.notifyCompletedKey: !notifyApiCallCompleted,
      DioApiProvider.notifyErrorKey: !notifyApiCallError,
    };

    options.extra == null
        ? options.extra = extraOptions
        : options.extra!.addAll(extraOptions);
  }
}
