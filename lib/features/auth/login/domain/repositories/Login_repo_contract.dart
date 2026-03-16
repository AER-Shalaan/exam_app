import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/Apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entitiies.dart';

// @injectable
abstract class LoginRepoContract {
  Future<BaseResponse<LoginEntitiies>> gettUsers({
    required LoginRequest request,
  });
}
