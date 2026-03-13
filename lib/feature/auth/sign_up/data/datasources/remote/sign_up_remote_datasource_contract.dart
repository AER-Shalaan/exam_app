import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/feature/auth/sign_up/data/models/sign_up_request/sign_up_request.dart';
import 'package:exam_app/feature/auth/sign_up/data/models/user_model.dart';

abstract class SignUpRemoteDatasourceContract {
  Future<BaseResponse<UserModel>> setUsers({
    required SignUpRequest request,
  });
}
