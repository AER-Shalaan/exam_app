import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/auth/sign_up/apis/response/sign_up_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class SignUpApiClient {
  @factoryMethod
  factory SignUpApiClient(Dio dio) = _SignUpApiClient;

  @POST(Endpoints.postSignUpEndpoint)
  Future<SignUpResponse> setUsers({
    @Body() required Map<String, dynamic> request,
  });
}
