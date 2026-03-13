import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/feature/auth/sign_up/data/models/sign_up_request/sign_up_request.dart';
import 'package:exam_app/feature/auth/sign_up/domain/entities/sign_up_entitiies.dart';

abstract class SignUpRepoContract {
  Future<BaseResponse<SignUpEntitiies>> setUsers({
    required SignUpRequest request,
  });
}
