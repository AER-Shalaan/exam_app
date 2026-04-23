import 'package:dio/dio.dart';
import 'package:exam_app/core/network/api_param.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/auth/login/apis/respones/login_respons.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_client.g.dart';

@injectable
@RestApi()
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio) = _LoginApiClient;

  @POST(Endpoints.postSignInEndpoint)
  @Extra({ApiParam.requiresAuth: false})
  Future<LoginResponse> getUsers({
    @Body() required Map<String, dynamic> request,
  });
}
