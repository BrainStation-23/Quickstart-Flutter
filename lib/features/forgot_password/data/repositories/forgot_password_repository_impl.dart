import 'package:qs_flutter/features/forgot_password/domain/repositories/forgot_password_repository.dart';

import '../datasources/forgot_password_data_source.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordDataSource dataSource;

  ForgotPasswordRepositoryImpl({
    required this.dataSource,
  });
}
