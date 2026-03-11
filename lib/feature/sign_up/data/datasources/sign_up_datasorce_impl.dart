import 'package:exam_app/feature/sign_up/data/datasources/sign_up_datasource_contract.dart';
import 'package:exam_app/feature/sign_up/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpDataSourceContract)
class SignUpDatasorceImpl implements SignUpDataSourceContract {
  @override
  Future<List<UserModel>> setUsers() async {
    await Future.delayed(Duration(seconds: 2));
    return [UserModel(userName: "user", email: "email", password: "password")];
  }
}
