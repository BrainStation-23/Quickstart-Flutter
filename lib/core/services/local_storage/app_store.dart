abstract class AppStorageI {
  Future<void> storeBearerToken(String token);
  Future<String?> retrieveBearerToken();
  Future<void> storeFcmToken(String token);
  Future<String?> retrieveFcmToken();
  Future<void> storeCredentials(Map<String, dynamic> credentials);
  Future<Map<String, dynamic>?> retrieveCredentials();
  Future<void> clearCredentials();
  Future<void> clearToken();
}
