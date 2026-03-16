import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/Apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/Apis/respones/user_model.dart';

abstract class LoginRemoteDatasourceContract {
  Future<BaseResponse<userModel>> getUsers({required LoginRequest request});
}
