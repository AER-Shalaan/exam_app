import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/Auth/forget_password/data/models/forget_password_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'forget_password_api_client.g.dart';

@injectable
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio) = _ForgetPasswordApiClient;

  @POST(Endpoints.postForgotPasswordEndpoint)
  Future<ForgetPasswordModel> sendEmail({
    @Body() required Map<String, dynamic> body
  });
}