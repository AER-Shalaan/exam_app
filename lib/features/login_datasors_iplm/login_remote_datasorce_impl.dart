import 'package:exam_app/core/error/error_handler.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/Apis/login_api_client.dart';
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

  @override
  Future<BaseResponse<UserModel>> setUsers({
    required Map<String, dynamic> body,
  }) {
    throw UnimplementedError();
  }
}
