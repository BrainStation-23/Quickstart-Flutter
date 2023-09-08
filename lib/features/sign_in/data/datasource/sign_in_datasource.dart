import 'package:dio/dio.dart';

abstract class SignInDataSource {
  Future<Response> signIn({required Map<String, dynamic> requestBody});
}
