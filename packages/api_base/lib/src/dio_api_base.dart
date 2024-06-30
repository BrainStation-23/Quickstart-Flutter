part of api_base;

//Dio implementation of API base
abstract class DioApiBase<
    TRequest extends ApiRequest,
    TResponse extends ApiResponse,
    TError extends ApiResponse> extends ApiBase<TRequest, TResponse, TError> {
  final String url;
  final DioApiProvider dioApiProvider;

  bool get propagateEvents => true;

  DioApiBase(this.url, this.dioApiProvider);

  @override
  Future<Either<TResponse, TError>> get(TRequest request) async {
    try {
      Map<String, dynamic> requestBody = request.toJson();
      Options options = Options(headers: headers);
      _updateExtraOptions(options);
      Response<Map<String, dynamic>> response = await dioApiProvider.dio.get(
        url,
        options: options,
        queryParameters: requestBody,
      );

      return _handleResponse(response);
    } on DioException catch (error) {
      return Right(_handleDioError(error));
    } catch (error) {
      return Right(_handleFrontEndError(error.toString()));
    }
  }

  @override
  Future<Either<TResponse, TError>> post(TRequest request) async {
    try {
      String requestBody = request.toString();
      Options options = Options(headers: headers);
      _updateExtraOptions(options);
      Response<Map<String, dynamic>> response = await dioApiProvider.dio.post(
        url,
        data: requestBody,
        options: options,
      );

      return _handleResponse(response);
    } on DioException catch (error) {
      return Right(_handleDioError(error));
    } catch (error) {
      return Right(_handleFrontEndError(error.toString()));
    }
  }

  @override
  Future<Either<TResponse, TError>> patch(TRequest request) async {
    try {
      String requestBody = request.toString();
      Options options = Options(headers: headers);
      _updateExtraOptions(options);
      Response<Map<String, dynamic>> response = await dioApiProvider.dio.patch(
        url,
        data: requestBody,
        options: options,
      );

      return _handleResponse(response);
    } on DioException catch (error) {
      return Right(_handleDioError(error));
    } catch (error) {
      return Right(_handleFrontEndError(error.toString()));
    }
  }

  @override
  Future<Either<TResponse, TError>> put(TRequest request) async {
    try {
      String requestBody = request.toString();
      Options options = Options(headers: headers);
      _updateExtraOptions(options);
      Response<Map<String, dynamic>> response = await dioApiProvider.dio.put(
        url,
        data: requestBody,
        options: options,
      );

      return _handleResponse(response);
    } on DioException catch (error) {
      return Right(_handleDioError(error));
    } catch (error) {
      return Right(_handleFrontEndError(error.toString()));
    }
  }

  @override
  Future<Either<TResponse, TError>> delete(TRequest request) async {
    try {
      String requestBody = request.toString();
      Options options = Options(headers: headers);
      _updateExtraOptions(options);
      Response<Map<String, dynamic>> response = await dioApiProvider.dio.delete(
        url,
        data: requestBody,
        options: options,
      );

      return _handleResponse(response);
    } on DioException catch (error) {
      return Right(_handleDioError(error));
    } catch (error) {
      return Right(_handleFrontEndError(error.toString()));
    }
  }

  TError _handleDioError(DioException exception) {
    return mapError(json: exception.response?.data, message: exception.message);
  }

  Either<TResponse, TError> _handleResponse(
      Response<Map<String, dynamic>> response) {
    if (response.data?.containsKey("data") ?? false) {
      return Left(mapResponse(response.data!["data"]));
    } else {
      return Right(mapError(json: response.data));
    }
  }

  TError _handleFrontEndError(String error) {
    return mapError(message: error);
  }

  void _updateExtraOptions(Options options) {
    Map<String, dynamic> extraOptions = {
      DioApiProvider.notifyStartedKey: propagateEvents,
      DioApiProvider.notifyCompletedKey: propagateEvents,
      DioApiProvider.notifyErrorKey: propagateEvents,
    };

    options.extra == null
        ? options.extra = extraOptions
        : options.extra!.addAll(extraOptions);
  }
}
