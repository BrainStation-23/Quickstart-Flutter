import 'package:dio/dio.dart';
import 'package:qs_flutter/features/sign_up/data/data_sources/sign_up_data_source.dart';

import '../../../../core/network/api_end_points.dart';
import '../../../../core/network/rest_client.dart';

class SignUpDataSourceImp implements SignUpDataSource {
  const SignUpDataSourceImp({required this.restClient});

  final RestClient restClient;

  @override
  Future<Response> signUp({required Map<String, dynamic> requestBody}) async {
    final response = await restClient.post(
      APIType.PUBLIC,
      ApiEndPoints.signUp,
      requestBody,
    );

    return response;
  }

  @override
  Future<Response> verifyOTP(
      {required Map<String, dynamic> requestBody}) async {
    final response = await restClient.post(
      APIType.PUBLIC,
      ApiEndPoints.verifyOtp,
      requestBody,
    );

    return response;
  }
}
