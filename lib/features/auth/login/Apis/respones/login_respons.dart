import 'package:exam_app/features/auth/login/apis/respones/user_model.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_respons.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserModel? user;

  LoginResponse({this.message, this.token, this.user});

  LoginEntity toDomain() => LoginEntity(
    message: message ?? "",
    token: token ?? "",
    user:
        user?.toEntity() ??
        UserEntity(
          id: "",
          username: "",
          firstName: "",
          lastName: "",
          email: "",
          phone: "",
          role: "",
          isVerified: false,
          createdAt: DateTime.now(),
        ),
  );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
