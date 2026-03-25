import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/sign_up/apis/sign_up_request/sign_up_request.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entity.dart';

abstract class SignUpRepoContract {
  Future<BaseResponse<SignUpEntity>> setUsers({
    required SignUpRequest request,
  });
}
