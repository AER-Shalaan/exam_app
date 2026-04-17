import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';

class LoginEntity {
  String message;
  String token;
  UserEntity user;

  LoginEntity({required this.message, required this.token, required this.user});
}
