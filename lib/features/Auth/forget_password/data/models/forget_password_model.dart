import 'package:exam_app/features/Auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_model.g.dart';


@JsonSerializable()
class ForgetPasswordModel{
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "info")
    String? info;

    ForgetPasswordModel({
        this.message,
        this.info,
    });

    ForgetPasswordEntity toDomain() => ForgetPasswordEntity(
        message: message ?? "",
        info: info ?? "",
    );

    factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) => _$ForgetPasswordModelFromJson(json);

    Map<String, dynamic> toJson() => _$ForgetPasswordModelToJson(this);
}