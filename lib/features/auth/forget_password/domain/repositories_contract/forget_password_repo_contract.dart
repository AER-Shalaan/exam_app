import 'package:exam_app/features/auth/forget_password/domain/entities/auth_response_entity.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/forget_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/reset_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/verify_reset_code_request_model.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';

abstract interface class ForgetPasswordRepositoryContract {
  Future<BaseResponse<ForgetPasswordEntity>> sendEmail({
    required ForgetPasswordRequestModel body,
  });
  Future<BaseResponse<VerifyResetCodeEntity>> verifyReset({
    required VerifyResetCodeRequestModel body,
  });
  Future<BaseResponse<AuthResponseEntity>> resetPassword({
    required ResetPasswordRequestModel body,
  });
}
