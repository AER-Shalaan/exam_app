import 'package:exam_app/core/storage/secure_storage.dart';

class TokenManager {
  TokenManager._();

  static String? _token;

  static String? get token => _token;

  static bool get isLoggedIn => _token != null;

  static Future<void> setToken(String token, {required bool rememberMe}) async {
    _token = token;

    await SecureStorage.saveRememberMe(rememberMe);

    if (rememberMe) {
      await SecureStorage.saveToken(token);
    }
  }

  static Future<void> init() async {
    final rememberMe = await SecureStorage.getRememberMe();

    if (!rememberMe) return;

    final savedToken = await SecureStorage.getToken();

    if (savedToken != null && savedToken.isNotEmpty) {
      _token = savedToken;
    }
  }

  static Future<void> clearToken() async {
    _token = null;
    await SecureStorage.clearAll();
  }
}
