import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/verify_reset_code_request_model.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/repositories_contract/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyOtpUseCase {
  VerifyOtpUseCase(this.forgetPasswordRepositoryContract);
  final ForgetPasswordRepositoryContract forgetPasswordRepositoryContract;

  Future<BaseResponse<VerifyResetCodeEntity>> call({
    required VerifyResetCodeRequestModel body,
  }) => forgetPasswordRepositoryContract.verifyReset(body: body);
}
