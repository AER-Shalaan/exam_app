import 'package:exam_app/core/network/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/apis/respones/user_model.dart';
import 'package:exam_app/features/auth/login/data/datasources/Remote/login_remote_datasource_contract.dart';
import 'package:exam_app/features/auth/login/data/mapper/login_mappers.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entitiies.dart';
import 'package:exam_app/features/auth/login/domain/repositories/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl implements LoginRepoContract {
  final LoginRemoteDatasourceContract _loginDataSourceContract;

  LoginRepoImpl(this._loginDataSourceContract);

  @override
  Future<BaseResponse<LoginEntitiies>> gettUsers({
    required LoginRequest request,
  }) {
    final response = _loginDataSourceContract.getUsers(request: request);

    return response.then((value) {
      switch (value) {
        case SuccessBaseResponse<userModel>():
          return SuccessBaseResponse<LoginEntitiies>(
            data: value.data.toEntity(),
          );

        case ErrorBaseResponse<userModel>():
          return ErrorBaseResponse<LoginEntitiies>(exception: value.exception);
      }
    });
  }
}
