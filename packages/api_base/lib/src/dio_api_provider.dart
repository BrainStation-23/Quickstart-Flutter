part of api_base;

abstract class DioApiProvider extends ApiProviderBase {
  late final Dio dio;

  static const String notifyStartedKey = "started";
  static const String notifyCompletedKey = "completed";
  static const String notifyErrorKey = "error";
  DioApiProvider() {
    dio = Dio(baseOptions);
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
    _setDioInterceptorList();
  }
  List<Interceptor> get additionalInterceptors => [];

  BaseOptions get baseOptions {
    return BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(milliseconds: connectionTimeout),
        receiveTimeout: Duration(milliseconds: receiveTimeout),
        headers: {
          "accept": "application/json",
          "content-type": "application/json",
        });
  }

  void _setDioInterceptorList() async {
    List<Interceptor> interceptorList = [];
    dio.interceptors.clear();

    if (shouldLogApi) {
      PrettyDioLogger prettyDioLogger = PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      );
      interceptorList.add(prettyDioLogger);
    }

    if (additionalInterceptors.isNotEmpty) {
      interceptorList.addAll(additionalInterceptors);
    }
    interceptorList.add(_getApiLifecycleInterceptor());

    dio.interceptors.addAll(interceptorList);
  }

  Interceptor _getApiLifecycleInterceptor() {
    return InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError);
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    bool notifyStarted = options.extra[notifyStartedKey] as bool? ?? false;

    if (notifyStarted) {
      notifyApiCallStarted();
    }

    handler.next(options);
  }

  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    bool notifyCompleted =
        response.requestOptions.extra[notifyCompletedKey] as bool? ?? false;

    if (notifyCompleted) {
      notifyApiCallCompleted();
    }

    handler.next(response);
  }

  Future<void> _onError(
      DioException error, ErrorInterceptorHandler handler) async {
    bool notifyError =
        error.requestOptions.extra[notifyErrorKey] as bool? ?? false;

    if (notifyError) {
      notifyApiError(error);
    }

    handler.next(error);
  }
}
