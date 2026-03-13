import 'package:exam_app/feature/auth/sign_up/data/models/user_model.dart';
import 'package:exam_app/feature/auth/sign_up/domain/entities/sign_up_entitiies.dart';

extension SignUpMapper on UserModel {
  SignUpEntitiies toEntity() => SignUpEntitiies(
    name: username,
    email: email,
    phone: phone,
    lastName: lastName,
  );
}
