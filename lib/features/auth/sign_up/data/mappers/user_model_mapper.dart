import 'package:exam_app/features/auth/sign_up/apis/response/user_model.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/user_entity.dart';

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
