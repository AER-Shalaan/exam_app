import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/auth/login/Apis/respones/login_respons.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio) = _LoginApiClient;

  @POST(Endpoints.postSignInEndpoint)
  Future<LoginRespon> getUsers({@Body() required Map<String, dynamic> request});
}
