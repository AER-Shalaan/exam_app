import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/sign_up/apis/response/set_user_response.dart';
import 'package:exam_app/features/auth/sign_up/data/models/sign_up_request/sign_up_request.dart';

abstract class SignUpRemoteDatasourceContract {
  Future<BaseResponse<SetUserResponse>> setUsers({
    required SignUpRequest request,
  });
}
