import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/login_screen/domain/entities/login_entitiies.dart';

// @injectable
abstract class LoginRepoContract {
  Future<BaseResponse<LoginEntitiies>> gettUsers({
    required Map<String, dynamic> body,
  });
}
