import 'package:biometric_auth/src/biometric_auth.dart';
import 'package:biometric_auth/src/use_cases/authentication_availability_use_case.dart';
import 'package:biometric_auth/src/use_cases/authentication_with_biometric_use_case.dart';

class LocalAuthImpl extends BiometricAuth {
  final AuthenticationAvailabilityUseCase _authenticationAvailabilityUseCase =
      AuthenticationAvailabilityUseCase();
  final AuthenticationWithBiometricUseCase _authenticationWithBiometricUseCase =
      AuthenticationWithBiometricUseCase();

  @override
  Future<bool> authenticateWithBiometric() async {
    try {
      return await _authenticationWithBiometricUseCase();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> canCheckBiometric() async {
    try {
      return await _authenticationAvailabilityUseCase();
    } catch (e) {
      rethrow;
    }
  }
}
