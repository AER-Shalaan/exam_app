import 'package:exam_app/feature/sign_up/data/models/user_model.dart';
import 'package:exam_app/feature/sign_up/domain/entities/sign_up_entitiies.dart';

extension SignUpMapper on SignUpEntitiies {
  UserModel toEntity() =>
      UserModel(userName: name, email: email, password: password);
}
