import 'dart:convert';

ErrorResponseModel errorModelFromJson(String str) =>
    ErrorResponseModel.fromJson(json.decode(str));

class ErrorResponseModel {
  ErrorResponseModel({
    this.error,
  });

  ErrorModel? error;

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      ErrorResponseModel(
        error: ErrorModel.fromJson(json['error']),
      );
}

class ErrorModel {
  ErrorModel({
    this.message = "Something went wrong! Please try again later.",
    this.statusCode = 500,
  });

  String? message;
  int? statusCode;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": statusCode,
      };

  @override
  String toString() {
    // TODO: implement toString
    return message.toString();
  }
}
