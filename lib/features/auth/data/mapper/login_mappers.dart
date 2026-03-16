import 'package:exam_app/features/login_screen/domain/entities/login_entitiies.dart';

extension LoginEntitiiesMapper on LoginEntitiies {
  LoginEntitiies toEntity() => LoginEntitiies(
    token: token,
    email: email,
    password: password,
  );
}
