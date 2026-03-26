import 'package:exam_app/core/entities/auth_response_entity.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_entity.dart';

abstract class ForgetPasswordRepositoryContract {
  Future<BaseResponse<ForgetPasswordEntity>> sendEmail({required Map<String, dynamic> body});
  Future<BaseResponse<VerifyResetEntity>> verifyReset({required Map<String, dynamic> body});
  Future<BaseResponse<AuthResponseEntity>> resetPassword({required Map<String, dynamic> body});
}