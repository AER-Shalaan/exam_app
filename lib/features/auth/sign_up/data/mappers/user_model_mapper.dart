import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';
import 'package:exam_app/features/auth/sign_up/apis/response/user_model.dart';

extension UserModelMapper on UserModel {
  UserEntity userToEntity() => UserEntity(
    firstName: firstName,
    lastName: lastName,
    username: username,
    email: email,
    phone: phone,
    role: role,
    isVerified: isVerified,
    id: id,
    createdAt: createdAt,
  );
}
