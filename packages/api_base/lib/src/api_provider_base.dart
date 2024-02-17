part of api_base;

abstract class ApiProviderBase {
  ApiProvider();

  String get baseUrl;

  String? get proxyUrl;

  bool get shouldLogApi;

  bool get showLoading;

  int get connectionTimeout => 30000;

  int get receiveTimeout => 30000;


  void dispose();
}
