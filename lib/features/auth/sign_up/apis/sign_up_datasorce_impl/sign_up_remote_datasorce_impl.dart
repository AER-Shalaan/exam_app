import 'package:exam_app/core/error/error_handler.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/sign_up/apis/response/sign_up_response.dart';
import 'package:exam_app/features/auth/sign_up/apis/sign_up_api_client/sign_up_api_client.dart';
import 'package:exam_app/features/auth/sign_up/data/datasources/remote/sign_up_remote_datasource_contract.dart';
import 'package:exam_app/features/auth/sign_up/apis/sign_up_request/sign_up_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRemoteDatasourceContract)
class SignUpRemoteDatasorceImpl implements SignUpRemoteDatasourceContract {
  final SignUpApiClient _signUpApiClient;
  SignUpRemoteDatasorceImpl(this._signUpApiClient);
  @override
  Future<BaseResponse<RegisterResponse>> setUsers({
    required SignUpRequest request,
  }) async {
    try {
      final response = await _signUpApiClient.setUsers(request: request.toJson());
      return SuccessBaseResponse<RegisterResponse>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<RegisterResponse>(
        exception: Exception(ErrorHandler.handle(e)),
      );
    }
  }
}
