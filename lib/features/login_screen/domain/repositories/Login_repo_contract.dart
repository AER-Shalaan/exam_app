import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/login_screen/domain/entities/login_entitiies.dart';

abstract class LoginRepoContract {
  Future<BaseResponse<LoginEntitiies>> setUsers({
    required Map<String, dynamic> body,
  });
}
