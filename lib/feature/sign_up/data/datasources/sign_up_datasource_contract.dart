import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/feature/sign_up/data/models/user_model.dart';

abstract class SignUpDataSourceContract {
  Future<BaseResponse<UserModel>> setUsers({
    required Map<String, dynamic> body,
  });
}
