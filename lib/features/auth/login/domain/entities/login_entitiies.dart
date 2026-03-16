import 'package:exam_app/features/auth/login/Apis/respones/user_model.dart';

class LoginEntitiies {
  String? email;
  String? password;
  String? message;
  String? token;
  userModel? user;

  LoginEntitiies({
    this.message,
    this.token,
    this.user,
    this.email,
    this.password,
  });
}
