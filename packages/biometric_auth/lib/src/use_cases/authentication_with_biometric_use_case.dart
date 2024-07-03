import 'package:biometric_auth/src/use_cases/authentication_availability_use_case.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthenticationWithBiometricUseCase {
  final LocalAuthentication auth = LocalAuthentication();
  Future<bool> call() async {
    final AuthenticationAvailabilityUseCase useCase =
        AuthenticationAvailabilityUseCase();
    try {
      if (await useCase()) {
        return await auth.authenticate(
            localizedReason: "Scan your finger to authenticate",
            options: const AuthenticationOptions(biometricOnly: true));
      } else {
        throw Exception("Biometric not available");
      }
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
