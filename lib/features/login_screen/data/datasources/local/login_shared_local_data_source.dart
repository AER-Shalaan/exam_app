import 'package:exam_app/core/network/api_param.dart';
import 'package:exam_app/features/login_screen/data/datasources/local/login_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginSharedLocalDataSource implements LoginLocalDataSource {
  static Future<String?> getToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(ApiParam.sharedTokenKey);
  }

  static Future<void> saveToken(String token) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(ApiParam.sharedTokenKey, token);
  }
}
