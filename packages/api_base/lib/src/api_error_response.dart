part of api_base;

abstract class ApiErrorResponse<TEntity> extends ApiResponse<TEntity> {
  String? httpStatusCode;
  String? httpStatusMessage;

  ApiErrorResponse(
    this.httpStatusCode,
    this.httpStatusMessage,
  );

  void setProperties({String? code, String? message}){
    httpStatusCode = code;
    httpStatusMessage = message;
  }
}
