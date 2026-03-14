import 'package:exam_app/features/auth/data/models/get_user_model.dart';
import 'package:exam_app/features/login_screen/domain/entities/login_entitiies.dart';

extension SignUpMapper on UserModel {
  LoginEntitiies toEntity() => LoginEntitiies(email: email, password: password);
}
