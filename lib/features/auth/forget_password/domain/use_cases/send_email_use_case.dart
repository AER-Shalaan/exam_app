import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/repositories_contract/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendEmailUseCase {
  SendEmailUseCase(this.forgetPasswordRepoContract);
  final ForgetPasswordRepositoryContract forgetPasswordRepoContract;

  Future<BaseResponse<ForgetPasswordEntity>> call({
    required Map<String, dynamic> body,
  }) {
    return forgetPasswordRepoContract.sendEmail(body: body);
  }
}
