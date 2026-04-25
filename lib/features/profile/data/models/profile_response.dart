import 'package:exam_app/features/auth/login/apis/respones/user_model.dart';
import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "user")
  UserModel? user;

  ProfileResponse({this.message, this.user});

  UserEntity toDomain() =>
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
      );

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
