import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio) = _LoginApiClient;

  @POST(Endpoints.postSignInEndpoint)
  Future<Response> setUsers({@Body() required Map<String, dynamic> body});
}
