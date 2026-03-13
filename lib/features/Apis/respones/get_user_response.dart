import 'package:exam_app/features/login_screen/data/models/get_user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_response.g.dart';
@JsonSerializable()
class GetUserResponse {
    
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserModel? user;

  GetUserResponse({this.message, this.token, this.user});

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserResponseToJson(this);
}
