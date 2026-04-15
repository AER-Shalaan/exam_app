import 'package:exam_app/core/network/api_param.dart';

class ForgetPasswordRequestModel {
  final String email;

  ForgetPasswordRequestModel({required this.email});

  Map<String, dynamic> toJson() {
    return {ApiParam.email: email};
  }
}
