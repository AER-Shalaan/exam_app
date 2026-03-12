import 'package:exam_app/core/models/auth_response_model.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_model.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_model.dart';

abstract class ForgetPasswordDataSourceContract {
  Future<BaseResponse<ForgetPasswordModel>> sendEmail({
    required Map<String, dynamic> body
  });
  Future<BaseResponse<VerifyResetModel>> verifyReset({
    required Map<String, dynamic> body
  });
  Future<BaseResponse<AuthResponseModel>> resetPassword({
    required Map<String, dynamic> body
  });
}