import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/Apis/respones/login_respons.dart';

abstract class LoginRemoteDatasourceContract {
  Future<BaseResponse<LoginRespons>> getUsers({
    required Map<String, dynamic> body,
  });
}
