import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/forget_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/reset_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/verify_reset_code_request_model.dart';
import 'package:exam_app/features/auth/forget_password/data/models/auth_response_model.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_model.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_model.dart';

abstract interface class ForgetPasswordDataSourceContract {
  Future<BaseResponse<ForgetPasswordModel>> sendEmail({
    required ForgetPasswordRequestModel body,
  });
  Future<BaseResponse<VerifyResetCodeModel>> verifyReset({
    required VerifyResetCodeRequestModel body,
  });
  Future<BaseResponse<AuthResponseModel>> resetPassword({
    required ResetPasswordRequestModel body,
  });
}
