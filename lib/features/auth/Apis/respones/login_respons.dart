import 'package:exam_app/features/auth/Apis/respones/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_respons.g.dart';

@JsonSerializable()

class LoginRespon {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  userModel? user;

  LoginRespon({this.message, this.token, this.user});

  factory LoginRespon.fromJson(Map<String, dynamic> json) =>
      _$LoginResponFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponToJson(this);
}
