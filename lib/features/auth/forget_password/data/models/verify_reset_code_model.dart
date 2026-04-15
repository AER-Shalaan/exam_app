import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_model.g.dart';

@JsonSerializable()
class VerifyResetCodeModel {
  @JsonKey(name: "status")
  String? status;

  VerifyResetCodeModel({this.status});

  VerifyResetCodeEntity toDomain() => VerifyResetCodeEntity(status: status ?? "");

  factory VerifyResetCodeModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeModelToJson(this);
}
