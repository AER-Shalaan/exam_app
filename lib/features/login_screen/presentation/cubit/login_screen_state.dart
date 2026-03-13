part of 'login_screen_cubit.dart';

abstract class LoginScreenState {
  const LoginScreenState();

  List<Object> get props => [];
}

final class LoginSuccess extends LoginScreenState {}

final class LoginLoading extends LoginScreenState {}

final class LoginFailure extends LoginScreenState {
  String errMessage;

  LoginFailure({required this.errMessage});
}
