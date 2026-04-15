import 'package:exam_app/core/network/api_param.dart';

class VerifyResetCodeRequestModel {
  final String resetCode;

  VerifyResetCodeRequestModel({required this.resetCode});

  Map<String, dynamic> toJson() {
    return {ApiParam.resetCode: resetCode};
  }
}
