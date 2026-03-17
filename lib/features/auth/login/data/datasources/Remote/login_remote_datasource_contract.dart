import 'package:exam_app/core/network/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/apis/respones/user_model.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';

abstract class LoginRemoteDatasourceContract {
  Future<BaseResponse<userModel>> getUsers({required LoginRequest request});
}
