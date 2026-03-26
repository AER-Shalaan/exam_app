import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/login/apis/respones/login_respons.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';

abstract class LoginRemoteDatasourceContract {
  Future<BaseResponse<LoginResponse>> getUser({required LoginRequest request});
}
