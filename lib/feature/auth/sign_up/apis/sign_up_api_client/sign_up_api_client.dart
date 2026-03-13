import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/feature/auth/sign_up/apis/response/set_user_response.dart';
import 'package:exam_app/feature/auth/sign_up/data/models/sign_up_request/sign_up_request.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class SignUpApiClient {
  @factoryMethod
  factory SignUpApiClient(Dio dio) = _SignUpApiClient;

  @POST(Endpoints.postSignUpEndpoint)
  Future<SetUserResponse> setUsers({
    @Body() required SignUpRequest request,
  });
}
