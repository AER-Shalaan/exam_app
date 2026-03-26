import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/sign_up/apis/response/sign_up_response.dart';
import 'package:exam_app/features/auth/sign_up/data/datasources/remote/sign_up_remote_datasource_contract.dart';
import 'package:exam_app/features/auth/sign_up/apis/sign_up_request/sign_up_request.dart';
import 'package:exam_app/features/auth/sign_up/data/mappers/sign_up_mappers.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:exam_app/features/auth/sign_up/domain/repositories/sign_up_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepoContract)
class SignUpRepoImpl implements SignUpRepoContract {
  final SignUpRemoteDatasourceContract _signUpDataSourceContract;

  SignUpRepoImpl(this._signUpDataSourceContract);

  @override
  Future<BaseResponse<SignUpEntity>> setUsers({
    required SignUpRequest request,
  }) async {
    final response = await _signUpDataSourceContract.setUsers(request: request);

    switch (response) {
      case SuccessBaseResponse<SignUpResponse>():
        final data = response.data.toEntity();
        return SuccessBaseResponse<SignUpEntity>(data: data);
      case ErrorBaseResponse<SignUpResponse>():
        return ErrorBaseResponse<SignUpEntity>(exception: response.exception);
    }
  }
}
