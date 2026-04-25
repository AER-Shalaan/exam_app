import 'package:exam_app/features/auth/sign_up/apis/response/sign_up_response.dart';
import 'package:exam_app/features/auth/sign_up/data/mappers/user_model_mapper.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entity.dart';

extension SignUpMapper on SignUpResponse {

  SignUpEntity toEntity() => SignUpEntity(
    message: message,
    token: token,
    user: user!.userToEntity(),
  );
}
