import 'package:exam_app/features/auth/sign_up/apis/response/models/sign_up_user_model.dart/user_model.dart';

class SignUpEntitiies {
  String? message;

  String? token;

  UserModel? user;

  SignUpEntitiies({this.message, this.token, this.user});

  SignUpEntitiies copyWith({String? message, String? token, UserModel? user}) {
    return SignUpEntitiies(
      message: message ?? this.message,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }
}
