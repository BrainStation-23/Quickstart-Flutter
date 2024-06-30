part of api_base;

abstract class ApiProviderBase {
  String get baseUrl;

  bool get shouldLogApi;

  int get connectionTimeout => 30000;

  int get receiveTimeout => 30000;

  void notifyApiCallStarted();

  void notifyApiCallCompleted();

  void notifyApiError([Object? error]);
}
