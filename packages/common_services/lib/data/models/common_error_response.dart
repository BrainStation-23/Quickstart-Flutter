import 'package:api_base/api_base.dart';
import 'package:common_services/domain/entities/common_error.dart';

class CommonErrorResponse extends ApiResponse {
  final String message;
  CommonErrorResponse(this.message);

  factory CommonErrorResponse.fromJson(Map<String, dynamic> json) {
    return CommonErrorResponse(json["message"] ?? "");
  }

  CommonError toEntity() {
    return CommonError(message: message);
  }
}
