import 'package:exam_app/feature/auth/sign_up/domain/entities/sign_up_entitiies.dart';

sealed class SignUpState<T> {}

class SignUpInitial<T> extends SignUpState<T> {}

class SignUpLoading<T> extends SignUpState<T> {}

class SignUpSuccess<T> extends SignUpState<T> {
  final SignUpEntitiies signUpEntitiies;
  SignUpSuccess({required this.signUpEntitiies});
}

class SignUpError<T> extends SignUpState<T> {
  final String message;
  SignUpError({required this.message});
}
