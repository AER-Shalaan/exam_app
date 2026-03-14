
import 'package:json_annotation/json_annotation.dart';

part 'get_user_model.g.dart';

@JsonSerializable()
class UserModel {
 
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;
  

  UserModel({
 
    this.email,
    this.password,
  
  });
  // UserModel toEntity() => UserModel(
  //   firstName: firstName,
  //   lastName: lastName,
  //   phone: phone,
  //   username: username,
  // );
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}