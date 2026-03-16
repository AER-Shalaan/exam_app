import 'package:exam_app/config/error/error_handler.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/Apis/api_client/login_api_client.dart';
import 'package:exam_app/features/auth/Apis/respones/login_respons.dart';
import 'package:exam_app/features/auth/data/datasources/Remote/login_remote_datasource_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDatasourceContract)
class LoginRemoteDatasorceImpl implements LoginRemoteDatasourceContract {
  late final LoginApiClient _loginApiClient;
  LoginRemoteDatasorceImpl(this._loginApiClient);
  @override
  Future<BaseResponse<LoginRespons>> getUsers({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _loginApiClient.getUsers(body: body);
      return SuccessBaseResponse<LoginRespons>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<LoginRespons>(
        exception: Exception(ErrorHandler.handle(e)),
      );
    }
  }
}
