import 'package:exam_app/core/entities/auth_response_entity.dart';
import 'package:exam_app/features/auth/forget_password/data/models/auth_response_model.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/forget_password/data/data_sources_contract/forget_password_data_source_contract.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_model.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_model.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/repositories_contract/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepositoryContract)
class ForgetPasswordRepoImpl implements ForgetPasswordRepositoryContract {
  ForgetPasswordRepoImpl(this.forgetPasswordDataSourceContract);

  final ForgetPasswordDataSourceContract forgetPasswordDataSourceContract;

  @override
  Future<BaseResponse<ForgetPasswordEntity>> sendEmail({
    required Map<String, dynamic> body,
  }) async {
    final response = await forgetPasswordDataSourceContract.sendEmail(
      body: body,
    );
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordModel>():
        final data = response.data.toDomain();
        return SuccessBaseResponse<ForgetPasswordEntity>(data: data);
      case ErrorBaseResponse<ForgetPasswordModel>():
        return ErrorBaseResponse<ForgetPasswordEntity>(
          exception: response.exception,
        );
    }
  }

  @override
  Future<BaseResponse<VerifyResetEntity>> verifyReset({
    required Map<String, dynamic> body,
  }) async {
    final response = await forgetPasswordDataSourceContract.verifyReset(
      body: body,
    );
    switch (response) {
      case SuccessBaseResponse<VerifyResetModel>():
        final data = response.data.toDomain();
        return SuccessBaseResponse<VerifyResetEntity>(data: data);
      case ErrorBaseResponse<VerifyResetModel>():
        return ErrorBaseResponse<VerifyResetEntity>(
          exception: response.exception,
        );
    }
  }

  @override
  Future<BaseResponse<AuthResponseEntity>> resetPassword({
    required Map<String, dynamic> body,
  }) async {
    final response = await forgetPasswordDataSourceContract.resetPassword(
      body: body,
    );
    switch (response) {
      case SuccessBaseResponse<AuthResponseModel>():
        final data = response.data.toDomain();
        return SuccessBaseResponse<AuthResponseEntity>(data: data);
      case ErrorBaseResponse<AuthResponseModel>():
        return ErrorBaseResponse<AuthResponseEntity>(
          exception: response.exception,
        );
    }
  }
}
