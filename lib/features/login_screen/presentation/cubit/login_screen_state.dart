import 'package:exam_app/features/login_screen/data/models/get_user_model.dart';

sealed class LoginScreenState {}

class LoginInitial extends LoginScreenState {}

class LoginLoading extends LoginScreenState {}

class LoginSuccess<T> extends LoginScreenState {
  final List<UserModel> loginEntitiies;

  LoginSuccess({required this.loginEntitiies});
}

class LoginError extends LoginScreenState {
  final String errormessage;

  LoginError(message, {required this.errormessage});
}
