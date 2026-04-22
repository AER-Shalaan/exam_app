import 'package:exam_app/features/auth/forget_password/domain/entities/auth_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "token")
  String? token;

  AuthResponseModel({this.message, this.token});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);

  AuthResponseEntity toDomain() {
    return AuthResponseEntity(message: message ?? "", token: token ?? "");
  }
}
