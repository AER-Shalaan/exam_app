import 'package:exam_app/features/auth/sign_up/data/models/sign_up_request/sign_up_request.dart';

sealed class SignUpEvent {}

class SignUpEventSetUsers extends SignUpEvent {
  final SignUpRequest request;
  SignUpEventSetUsers({required this.request});
}

class SignUpEventError extends SignUpEvent {
  final String message;
  SignUpEventError({required this.message});
}

class SignUpEventSuccess extends SignUpEvent {}
