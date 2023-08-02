import 'error_model.dart';

class NetworkExceptionV2 implements Exception {
  NetworkExceptionV2({this.errorModel,this.errorResponseModel});

  final ErrorModel? errorModel;
  final ErrorResponseModel? errorResponseModel;

  @override
  String toString() {
    return errorModel.toString();
  }
}

class NotFoundException extends NetworkExceptionV2 {
  NotFoundException(ErrorModel errorModel) : super(errorModel: errorModel);
}

class RequestTimeoutException extends NetworkExceptionV2 {
  RequestTimeoutException(ErrorModel errorModel) : super(errorModel: errorModel);
}

class BadRequestException extends NetworkExceptionV2 {
  BadRequestException(ErrorResponseModel errorModel) : super(errorResponseModel: errorModel);
}

class BadGatewayException extends NetworkExceptionV2 {
  BadGatewayException(ErrorModel errorModel) : super(errorModel: errorModel);
}

class DefaultException extends NetworkExceptionV2 {
  DefaultException(ErrorModel errorModel) : super(errorModel: errorModel);
}

//--------------------------------------OLD Implementation----------------------

class NetworkException implements Exception {
  NetworkException(this._errorCode, this._message, this._prefix);

  final dynamic _message;
  final int _errorCode;
  final String _prefix;

  String get errorMessage => "$_message $_prefix";

  int get errorCode => _errorCode;

  @override
  String toString() {
    // return '$_errorCode: $_prefix: $_message';
    return _message;
  }
}

class RequestCancelledException extends NetworkException {
  RequestCancelledException(errorCode, [message])
      : super(errorCode, message, 'Request Cancelled Exception');
}

class ReceiveTimeoutException extends NetworkException {
  ReceiveTimeoutException(errorCode, [message])
      : super(errorCode, message, 'Receive Timeout Exception');
}

class FetchDataException extends NetworkException {
  FetchDataException(errorCode, [message])
      : super(errorCode, message, 'Fetch Data Exception');
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException(errorCode, [message])
      : super(errorCode, message, 'Unauthorised');
}

class ConflictException extends NetworkException {
  ConflictException(errorCode, [message])
      : super(errorCode, message, 'Conflict Exception');
}

class InternalServerException extends NetworkException {
  InternalServerException(errorCode, [message])
      : super(errorCode, message, 'Internal Server Exception');
}

class UnexpectedException extends NetworkException {
  UnexpectedException(errorCode, [message])
      : super(errorCode, message, 'Unexpected Error');
}

class InvalidInputException extends NetworkException {
  InvalidInputException(errorCode, [message])
      : super(errorCode, message, 'Invalid Input');
}

class UnAuthenticatedException extends NetworkException {
  UnAuthenticatedException(errorCode, [message])
      : super(errorCode, message, 'Authentication failed!');
}
