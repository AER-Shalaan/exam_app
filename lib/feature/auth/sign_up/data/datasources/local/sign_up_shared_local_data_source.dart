import 'package:exam_app/core/database/shared_pref_helper.dart';
import 'package:exam_app/core/network/api_param.dart';
import 'package:exam_app/feature/auth/sign_up/data/datasources/local/sign_up_local_data_source.dart';

class SignUpSharedLocalDataSource implements SignUpLocalDataSource {
  static Future<String?> getToken() async {
    // final sharedPref = await SharedPreferences.getInstance();
    // return sharedPref.getString(ApiParam.sharedTokenKey);
    SharedPrefHelper.getString(ApiParam.sharedTokenKey);

  }

  static Future<void> saveToken(String token) async {
    // final sharedPref = await SharedPreferences.getInstance();
    // await sharedPref.setString(ApiParam.sharedTokenKey, token);
    SharedPrefHelper.setString(ApiParam.sharedTokenKey, token);
  }
}
