import 'package:exam_app/core/error/error_handler.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/feature/sign_up/apis/sign_up_api_client/sign_up_api_client.dart';
import 'package:exam_app/feature/sign_up/data/datasources/remote/sign_up_remote_datasource_contract.dart';
import 'package:exam_app/feature/sign_up/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRemoteDatasourceContract)
class SignUpRemoteDatasorceImpl implements SignUpRemoteDatasourceContract {
  final SignUpApiClient _signUpApiClient;
  SignUpRemoteDatasorceImpl(this._signUpApiClient);
  @override
  Future<BaseResponse<UserModel>> setUsers({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _signUpApiClient.setUsers(body: body);
      return SuccessBaseResponse<UserModel>(data: response.user ?? UserModel());
    } on Exception catch (e) {
      return ErrorBaseResponse<UserModel>(
        exception: Exception(ErrorHandler.handle(e)),
      );
    }
  }
}
