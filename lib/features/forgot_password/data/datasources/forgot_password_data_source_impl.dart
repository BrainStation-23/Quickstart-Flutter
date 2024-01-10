import '../../../../core/network/rest_client.dart';
import 'forgot_password_data_source.dart';

class ForgotPasswordDataSourceImpl implements ForgotPasswordDataSource {
  final RestClient restClient;

  ForgotPasswordDataSourceImpl({
    required this.restClient,
  });
}
