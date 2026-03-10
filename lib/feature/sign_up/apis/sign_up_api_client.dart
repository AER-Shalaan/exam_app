import 'package:exam_app/feature/sign_up/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignUpApiClient {
  Future<List<UserModel>> setUsers() async {
    await Future.delayed(const Duration(seconds: 2));
    return [UserModel(userName: "user", email: "email", password: "password")];
  }
}
