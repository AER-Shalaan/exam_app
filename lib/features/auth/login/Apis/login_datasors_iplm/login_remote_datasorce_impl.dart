import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/error/error_handler.dart';
import 'package:exam_app/features/auth/login/Apis/api_client/login_api_client.dart';
import 'package:exam_app/features/auth/login/Apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/Apis/respones/user_model.dart';
import 'package:exam_app/features/auth/login/data/datasources/Remote/login_remote_datasource_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDatasourceContract)
class LoginRemoteDatasorceImpl implements LoginRemoteDatasourceContract {
  late final LoginApiClient _loginApiClient;
  LoginRemoteDatasorceImpl(this._loginApiClient);
  @override
  Future<BaseResponse<userModel>> getUsers({
    required LoginRequest request ,
  }) async {
    try {
      final response = await _loginApiClient.getUsers(request: request.toJson());
      return SuccessBaseResponse<userModel>(data: response.user!);
    } on Exception catch (e) {
      return ErrorBaseResponse<userModel>(
        exception: Exception(ErrorHandler.handle(e)),
      );
    }
  }
}
