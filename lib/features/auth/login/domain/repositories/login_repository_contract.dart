import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entity.dart';

abstract class LoginRepositoryContract {
  Future<BaseResponse<LoginEntity>> getUser({required LoginRequest request});
}
