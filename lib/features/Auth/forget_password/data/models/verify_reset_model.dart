import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_model.g.dart';

@JsonSerializable()
class VerifyResetModel {
  @JsonKey(name: "status")
  String? status;

  VerifyResetModel({this.status});

      VerifyResetEntity toDomain() => VerifyResetEntity(
        status: status ?? "",
    );


  factory VerifyResetModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetModelToJson(this);
}
