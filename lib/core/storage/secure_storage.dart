import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static const FlutterSecureStorage storage = FlutterSecureStorage();
  static const String tokenKey = 'user_token';
  static const String rememberKey = 'remember_me';

  static Future<void> saveToken(String token) async {
    await storage.write(key: tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: tokenKey);
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: tokenKey);
  }

  static Future<void> saveRememberMe(bool value) async {
    await storage.write(key: rememberKey, value: value.toString());
  }

  static Future<bool> getRememberMe() async {
    final value = await storage.read(key: rememberKey);
    return value == 'true';
  }

  static Future<void> clearAll() async {
    await storage.deleteAll();
  }
}