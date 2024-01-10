import 'error_model.dart';

class NetworkExceptionV2 implements Exception {
  NetworkExceptionV2({this.errorModel, this.errorResponseModel});

  final ErrorModel? errorModel;
  final ErrorResponseModel? errorResponseModel;

  @override
  String toString() {
    return errorModel?.message.toString() ?? "Something unexpected happend";
  }
}

class NotFoundException extends NetworkExceptionV2 {
  NotFoundException(ErrorModel errorModel) : super(errorModel: errorModel);
}

class RequestTimeoutException extends NetworkExceptionV2 {
  RequestTimeoutException(ErrorModel errorModel)
      : super(errorModel: errorModel);
}

class BadRequestException extends NetworkExceptionV2 {
  BadRequestException(ErrorResponseModel errorModel)
      : super(errorResponseModel: errorModel);
}

class BadGatewayException extends NetworkExceptionV2 {
  BadGatewayException(ErrorModel errorModel) : super(errorModel: errorModel);
}

class DefaultException extends NetworkExceptionV2 {
  DefaultException(ErrorModel errorModel) : super(errorModel: errorModel);
}

class RequestCancelledException extends NetworkExceptionV2 {
  RequestCancelledException(ErrorModel errorModel)
      : super(errorModel: errorModel);
}

class ReceiveTimeoutException extends NetworkExceptionV2 {
  ReceiveTimeoutException(ErrorModel errorModel)
      : super(errorModel: errorModel);
}

class NetworkException extends NetworkExceptionV2 {
  NetworkException(statusCode, message)
      : super(errorModel: ErrorModel(statusCode: statusCode, message: message));
}

class UnauthorisedException extends NetworkExceptionV2 {
  UnauthorisedException(statusCode, message)
      : super(errorModel: ErrorModel(statusCode: statusCode, message: message));
}

class ConflictException extends NetworkExceptionV2 {
  ConflictException(statusCode, message)
      : super(errorModel: ErrorModel(statusCode: statusCode, message: message));
}

class InternalServerException extends NetworkExceptionV2 {
  InternalServerException(statusCode, message)
      : super(errorModel: ErrorModel(statusCode: statusCode, message: message));
}

class UnexpectedException extends NetworkExceptionV2 {
  UnexpectedException(statusCode, message)
      : super(errorModel: ErrorModel(statusCode: statusCode, message: message));
}
