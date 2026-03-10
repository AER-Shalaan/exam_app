import 'package:exam_app/feature/sign_up/data/models/user_model.dart';

abstract class SignUpDataSourceContract {
  Future<List<UserModel>> setUsers();
}
