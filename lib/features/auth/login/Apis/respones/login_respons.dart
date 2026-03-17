import 'package:exam_app/features/auth/login/apis/respones/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_respons.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  userModel? user;

  LoginResponse({this.message, this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
