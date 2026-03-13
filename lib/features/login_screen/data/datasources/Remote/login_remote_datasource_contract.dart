import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/login_screen/data/models/get_user_model.dart';

abstract class LoginRemoteDatasourceContract {
  Future<BaseResponse<UserModel>> setUsers({
    required Map<String, dynamic> body,
  });
}
