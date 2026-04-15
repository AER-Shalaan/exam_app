import 'package:exam_app/core/network/api_param.dart';

class ResetPasswordRequestModel {
  final String email;
  final String newPassword;

  ResetPasswordRequestModel({required this.newPassword, required this.email});

  Map<String, dynamic> toJson() {
    return {ApiParam.email: email, ApiParam.newPassword: newPassword};
  }
}
