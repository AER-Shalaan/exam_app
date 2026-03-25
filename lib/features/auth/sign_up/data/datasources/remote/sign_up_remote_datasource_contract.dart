import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/sign_up/apis/response/sign_up_response.dart';
import 'package:exam_app/features/auth/sign_up/apis/sign_up_request/sign_up_request.dart';

abstract class SignUpRemoteDatasourceContract {
  Future<BaseResponse<SignUpResponse>> setUsers({
    required SignUpRequest request,
  });
}
