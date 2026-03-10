import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/feature/sign_up/apis/response/set_user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_api_client.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class SignUpApiClient {
  factory SignUpApiClient(Dio dio, {String? baseUrl}) = _SignUpApiClient;

  @GET(Endpoints.postSignUpEndpoint)
  Future<List<SetUserResponse>> setUsers();
}
