import 'package:local_auth/local_auth.dart';

class AuthenticationAvailabilityUseCase {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> call() async {
    return await _canCheckBiometric() && await _isBiometricAvailable();
  }

  Future<bool> _canCheckBiometric() async => await auth.canCheckBiometrics;

  Future<bool> _isBiometricAvailable() async =>
      (await auth.getAvailableBiometrics()).isNotEmpty;
}
