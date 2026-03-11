import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/Auth/forget_password/data/models/forget_password_model.dart';

abstract class ForgetPasswordDataSourceContract {
  Future<BaseResponse<ForgetPasswordModel>> sendEmail({
    required Map<String, dynamic> body
  });
}