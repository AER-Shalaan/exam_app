import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/core/storage/secure_storage.dart';
import 'package:exam_app/features/auth/sign_up/apis/response/set_user_response.dart';
import 'package:exam_app/features/auth/sign_up/data/datasources/remote/sign_up_remote_datasource_contract.dart';
import 'package:exam_app/features/auth/sign_up/data/mappers/sign_up_mappers.dart';
import 'package:exam_app/features/auth/sign_up/data/models/sign_up_request/sign_up_request.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entitiies.dart';
import 'package:exam_app/features/auth/sign_up/domain/repositories/sign_up_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepoContract)
class SignUpRepoImpl implements SignUpRepoContract {
  final SignUpRemoteDatasourceContract _signUpDataSourceContract;

  SignUpRepoImpl(this._signUpDataSourceContract);

  @override
  Future<BaseResponse<SignUpEntitiies>> setUsers({
    required SignUpRequest request,
  }) async {
    final response = await _signUpDataSourceContract.setUsers(request: request);

    switch (response) {
      case SuccessBaseResponse<SetUserResponse>():
        await SecureStorage.saveToken(response.data.token ?? "");

        return SuccessBaseResponse<SignUpEntitiies>(
          data: response.data.user!.toEntity(),
        );

      case ErrorBaseResponse<SetUserResponse>():
        return ErrorBaseResponse<SignUpEntitiies>(
          exception: response.exception,
        );
    }
  }
}
