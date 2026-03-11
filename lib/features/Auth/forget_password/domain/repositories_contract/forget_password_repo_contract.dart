import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/Auth/forget_password/domain/entities/forget_password_entity.dart';

abstract class ForgetPasswordRepositoryContract {
  Future<BaseResponse<ForgetPasswordEntity>> sendEmail({required Map<String, dynamic> body});
}