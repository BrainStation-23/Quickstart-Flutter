part of api_base;

class ApiErrorResponse extends ApiResponse {
  int? statusCode;
  String? message;

  ApiErrorResponse(
    this.statusCode,
    this.message,
  );

  void setProperties({int? code, String? msg}){
    statusCode = code;
    message = msg;
  }
}
