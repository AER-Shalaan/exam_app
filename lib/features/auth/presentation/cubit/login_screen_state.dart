import 'package:exam_app/features/auth/data/models/get_user_model.dart';

sealed class LoginScreenState {}

class LoginInitial<T> extends LoginScreenState {}

class LoginLoading<T> extends LoginScreenState {}

class LoginSuccess<T> extends LoginScreenState {
  final List<UserModel> loginEntitiies;

  LoginSuccess({required this.loginEntitiies});
}

class LoginError extends LoginScreenState {
  final String errormessage;

  // ignore: non_constant_identifier_names, strict_top_level_inference
  LoginError(Message, {required this.errormessage});
}
