abstract class BiometricAuth{
  Future<bool> canCheckBiometric();
  Future<bool> authenticateWithBiometric();
}