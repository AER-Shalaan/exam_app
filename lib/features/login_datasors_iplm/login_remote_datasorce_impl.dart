import 'package:exam_app/config/error/error_handler.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/Apis/api_client/login_api_client.dart';
import 'package:exam_app/features/login_screen/data/datasources/Remote/login_remote_datasource_contract.dart';
import 'package:exam_app/features/login_screen/data/models/get_user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDatasourceContract)
class LoginRemoteDatasorceImpl implements LoginRemoteDatasourceContract {
  late final LoginApiClient _loginApiClient;
  LoginRemoteDatasorceImpl(this._loginApiClient);
  Future<BaseResponse<UserModel>> getUsers({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _loginApiClient.getUsers(body: body);
      return SuccessBaseResponse<UserModel>(data: response.user ?? UserModel());
    } on Exception catch (e) {
      return ErrorBaseResponse<UserModel>(
        exception: Exception(ErrorHandler.handle(e)),
      );
    }
  }
}
