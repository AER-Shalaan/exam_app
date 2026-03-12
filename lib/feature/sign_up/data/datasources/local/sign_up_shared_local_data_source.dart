import 'package:exam_app/core/network/api_param.dart';
import 'package:exam_app/feature/sign_up/data/datasources/local/sign_up_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpSharedLocalDataSource implements SignUpLocalDataSource {
  static Future<String?> getToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(ApiParam.sharedTokenKey);
  }

  static Future<void> saveToken(String token) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(ApiParam.sharedTokenKey, token);
  }
}
