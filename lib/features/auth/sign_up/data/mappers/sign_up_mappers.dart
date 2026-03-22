import 'package:exam_app/features/auth/sign_up/apis/response/models/sign_up_user_model.dart/user_model.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entitiies.dart';

extension SignUpMapper on UserModel {
  SignUpEntitiies toEntity() => SignUpEntitiies(
    message: "message",
    token: "token",
    user: this,
  );
}
