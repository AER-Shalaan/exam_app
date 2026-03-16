import 'package:exam_app/core/network/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entitiies.dart';

abstract class LoginRepoContract {
  Future<BaseResponse<LoginEntitiies>> gettUsers({
    required LoginRequest request,
  });
}
