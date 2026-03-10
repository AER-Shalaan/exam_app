import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();
  static final FlutterSecureStorage storage = const FlutterSecureStorage();
  static const String tokenKey = 'user_token';

  static Future<void> saveToken(String token) async {
    await storage.write(key: tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: tokenKey);
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: tokenKey);
  }

  static Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
