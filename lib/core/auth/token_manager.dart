import 'package:exam_app/core/storage/secure_storage.dart';

class TokenManager {
  TokenManager._();

  static String? _token;
  static String? _userId;

  static String? get token => _token;
  static String? get userId => _userId;
  static bool get isLoggedIn => _token != null;

  static Future<void> setToken(String token, {required bool rememberMe, String? userId}) async {
    _token = token;
    _userId = userId;

    await SecureStorage.saveRememberMe(rememberMe);

    if (rememberMe) {
      await SecureStorage.saveToken(token);
      if (userId != null) await SecureStorage.saveUserId(userId);
    }
  }

  static Future<void> init() async {
    final rememberMe = await SecureStorage.getRememberMe();
    if (!rememberMe) return;

    final savedToken = await SecureStorage.getToken();
    if (savedToken != null && savedToken.isNotEmpty) {
      _token = savedToken;
    }

    final savedUserId = await SecureStorage.getUserId();
    if (savedUserId != null && savedUserId.isNotEmpty) {
      _userId = savedUserId;
    }
  }

  static Future<void> clearToken() async {
    _token = null;
    _userId = null;
    await SecureStorage.clearAll();
  }
}