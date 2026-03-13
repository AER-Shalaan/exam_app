import 'package:exam_app/feature/auth/sign_up/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_user_response.g.dart';

@JsonSerializable()
class SetUserResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserModel? user;

  SetUserResponse({this.message, this.token, this.user});

  factory SetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SetUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SetUserResponseToJson(this);
}
