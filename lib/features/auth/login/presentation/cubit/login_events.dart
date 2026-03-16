import 'package:exam_app/features/auth/login/apis/request/login_request.dart';

sealed class LoginEvents {}

class GetUser extends LoginEvents {
  final LoginRequest request;
  GetUser({required this.request});
}
