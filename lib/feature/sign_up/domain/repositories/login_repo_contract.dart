import 'package:exam_app/feature/sign_up/domain/entities/login_entitiies.dart';

abstract class LoginRepoContract {
  Future<List<LoginEntitiies>> login();
}
