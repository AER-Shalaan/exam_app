import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/Auth/forget_password/data/data_sources_contract/forget_password_data_source_contract.dart';
import 'package:exam_app/features/Auth/forget_password/data/models/forget_password_model.dart';
import 'package:exam_app/features/Auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/Auth/forget_password/domain/repositories_contract/forget_password_repo_contract.dart';
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
}
