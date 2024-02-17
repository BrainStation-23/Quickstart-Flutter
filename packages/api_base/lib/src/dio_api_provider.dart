part of api_base;

abstract class DioApiProvider extends ApiProviderBase {
  static const String notifyStartedKey = "started";
  static const String notifyCompletedKey = "completed";
  static const String notifyErrorKey = "error";

  late final Dio dio;

  DioApiProvider() {
    dio = Dio(baseOptions);
    _setDioInterceptorList();
    _setProxyConfiguration();
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
      interceptorList.add(PrettyDioLogger());
    }

    if (additionalInterceptors.isNotEmpty) {
      interceptorList.addAll(additionalInterceptors);
    }

  }

  void _setProxyConfiguration() {
    if (proxyUrl != null && proxyUrl!.isNotEmpty) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        HttpClient client = HttpClient();
        client.findProxy = (uri) => "PROXY $proxyUrl";
        client.badCertificateCallback =
            (X509Certificate certificate, String host, int port) => true;
        return client;
      };
    }
  }
}
