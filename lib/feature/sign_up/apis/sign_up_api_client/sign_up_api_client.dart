import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/feature/sign_up/apis/response/set_user_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_api_client.g.dart';

@Injectable(as:SignUpApiClient)
@RestApi()

abstract class SignUpApiClient {
  factory SignUpApiClient(Dio dio) = _SignUpApiClient;

  @GET(Endpoints.postSignUpEndpoint)
  Future<SetUserResponse> setUsers();
}
