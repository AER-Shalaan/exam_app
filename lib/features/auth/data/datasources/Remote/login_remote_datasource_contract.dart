import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/data/models/get_user_model.dart';

abstract class LoginRemoteDatasourceContract {
  Future<BaseResponse<UserModel>> getUsers({
    required Map<String, dynamic> body,
  });
}
