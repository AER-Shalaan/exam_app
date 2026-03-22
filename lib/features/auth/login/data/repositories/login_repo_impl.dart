import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/apis/respones/login_respons.dart';
import 'package:exam_app/features/auth/login/data/datasources/Remote/login_remote_datasource_contract.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:exam_app/features/auth/login/domain/repositories/login_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepositoryContract)
class LoginRepoImpl implements LoginRepositoryContract {
  LoginRepoImpl(this._loginRemoteDatasourceContract);

  final LoginRemoteDatasourceContract _loginRemoteDatasourceContract;
  @override
  Future<BaseResponse<LoginEntity>> getUser({
    required LoginRequest request,
  }) async {
    final response = await _loginRemoteDatasourceContract.getUser(
      request: request,
    );
    switch (response) {
      case SuccessBaseResponse<LoginResponse>():
        final data = response.data.toDomain();
        return SuccessBaseResponse<LoginEntity>(data: data);
      case ErrorBaseResponse<LoginResponse>():
        return ErrorBaseResponse<LoginEntity>(exception: response.exception);
    }
  }
}
