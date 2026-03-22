import 'package:exam_app/features/auth/login/apis/request/login_request.dart';

sealed class LoginEvents {}

class LoginUserEvent extends LoginEvents {
  final LoginRequest request;
  final bool rememberMe;

  LoginUserEvent({required this.request, required this.rememberMe});
}
