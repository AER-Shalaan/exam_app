import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/login/apis/respones/login_respons.dart';
import 'package:exam_app/features/auth/login/apis/api_client/login_api_client.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/data/datasources/Remote/login_remote_datasource_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDatasourceContract)
class LoginRemoteDatasorceImpl implements LoginRemoteDatasourceContract {
  final LoginApiClient _loginApiClient;
  LoginRemoteDatasorceImpl(this._loginApiClient);
  @override
  Future<BaseResponse<LoginResponse>> getUser({
    required LoginRequest request,
  }) async {
    try {
      final response = await _loginApiClient.getUsers(
        request: request.toJson(),
      );
      return SuccessBaseResponse<LoginResponse>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<LoginResponse>(exception: e);
    }
  }
}
