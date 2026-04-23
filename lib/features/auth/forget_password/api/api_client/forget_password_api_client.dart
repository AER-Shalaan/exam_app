import 'package:dio/dio.dart';
import 'package:exam_app/core/network/api_param.dart';
import 'package:exam_app/features/auth/forget_password/data/models/auth_response_model.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/forget_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/reset_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/verify_reset_code_request_model.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_model.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'forget_password_api_client.g.dart';

@lazySingleton
@RestApi()
abstract interface class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio) = _ForgetPasswordApiClient;

  @POST(Endpoints.postForgotPasswordEndpoint)
  @Extra({ApiParam.requiresAuth: false})
  Future<ForgetPasswordModel> sendEmail({
    @Body() required ForgetPasswordRequestModel body,
  });

  @POST(Endpoints.postVerifyResetCodeEndpoint)
  @Extra({ApiParam.requiresAuth: false})
  Future<VerifyResetCodeModel> verifyReset({
    @Body() required VerifyResetCodeRequestModel body,
  });

  @PUT(Endpoints.putResetPasswordEndpoint)
  @Extra({ApiParam.requiresAuth: false})
  Future<AuthResponseModel> resetPassword({
    @Body() required ResetPasswordRequestModel body,
  });
}
