import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/feature/sign_up/domain/entities/sign_up_entitiies.dart';

abstract class SignUpRepoContract {
  Future<BaseResponse<SignUpEntitiies>> setUsers({
    required Map<String, dynamic> body,
  });
}
