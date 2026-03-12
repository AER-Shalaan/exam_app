import 'package:exam_app/feature/sign_up/apis/sign_up_api_client/sign_up_api_client.dart';
import 'package:exam_app/feature/sign_up/data/datasources/sign_up_datasource_contract.dart';
import 'package:exam_app/feature/sign_up/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpDataSourceContract)
class SignUpDatasorceImpl implements SignUpDataSourceContract {
  final SignUpApiClient _signUpApiClient;
  SignUpDatasorceImpl(this._signUpApiClient);
  @override
  Future<List<UserModel>> setUsers() async {
    await Future.delayed(Duration(seconds: 2));
    return [UserModel(username: "user", email: "email")];
    // final response=await _apiClient.setUsers();
    // return response.user;
  }
}
