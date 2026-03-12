import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/Auth/forget_password/domain/entities/verify_reset_entity.dart';
import 'package:exam_app/features/Auth/forget_password/domain/repositories_contract/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyOtpUseCase {
  VerifyOtpUseCase(this.forgetPasswordRepositoryContract);
  final ForgetPasswordRepositoryContract forgetPasswordRepositoryContract;

  Future<BaseResponse<VerifyResetEntity>> call({
    required Map<String, dynamic> body,
  }) => forgetPasswordRepositoryContract.verifyReset(body: body);
}
