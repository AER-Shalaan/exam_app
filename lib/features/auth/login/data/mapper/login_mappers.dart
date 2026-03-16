import 'package:exam_app/features/auth/login/apis/respones/user_model.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entitiies.dart';

extension LoginEntitiiesMapper on userModel {
  LoginEntitiies toEntity() => LoginEntitiies(email: email);
}
