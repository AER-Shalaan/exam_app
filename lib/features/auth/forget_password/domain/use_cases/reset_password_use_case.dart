import 'package:exam_app/features/auth/forget_password/domain/entities/auth_response_entity.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/reset_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/domain/repositories_contract/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  ResetPasswordUseCase(this.forgetPasswordRepoContract);
  final ForgetPasswordRepositoryContract forgetPasswordRepoContract;

  Future<BaseResponse<AuthResponseEntity>> call({
    required ResetPasswordRequestModel body,
  }) {
    return forgetPasswordRepoContract.resetPassword(body: body);
  }
}
