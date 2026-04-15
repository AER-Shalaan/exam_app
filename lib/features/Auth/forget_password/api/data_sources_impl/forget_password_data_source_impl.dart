import 'package:exam_app/core/models/auth_response_model.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/forget_password/api/api_client/forget_password_api_client.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/forget_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/reset_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/verify_reset_code_request_model.dart';
import 'package:exam_app/features/auth/forget_password/data/data_sources_contract/forget_password_data_source_contract.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_model.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordDataSourceContract)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSourceContract {
  ForgetPasswordDataSourceImpl(this.forgetPasswordApiClient);

  final ForgetPasswordApiClient forgetPasswordApiClient;
  @override
  Future<BaseResponse<ForgetPasswordModel>> sendEmail({
    required ForgetPasswordRequestModel body,
  }) async {
    try {
      final response = await forgetPasswordApiClient.sendEmail(body: body);
      return SuccessBaseResponse<ForgetPasswordModel>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<ForgetPasswordModel>(exception: e);
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeModel>> verifyReset({
    required VerifyResetCodeRequestModel body,
  }) async {
    try {
      final response = await forgetPasswordApiClient.verifyReset(body: body);
      return SuccessBaseResponse<VerifyResetCodeModel>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<VerifyResetCodeModel>(exception: e);
    }
  }

  @override
  Future<BaseResponse<AuthResponseModel>> resetPassword({
    required ResetPasswordRequestModel body,
  }) async {
    try {
      final response = await forgetPasswordApiClient.resetPassword(body: body);
      return SuccessBaseResponse<AuthResponseModel>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<AuthResponseModel>(exception: e);
    }
  }
}
