import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/profile/data/models/profile_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api_client.g.dart';

@injectable
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  @GET(Endpoints.getProfileDataEndpoint)
  Future<ProfileResponse> getProfileData();

  @PUT(Endpoints.putEditProfileEndpoint)
  Future<ProfileResponse> updateProfile(
    @Body() FormData body,
  );

  @PATCH(Endpoints.patchChangePasswordEndpoint)
  Future<dynamic> changePassword(@Body() Map<String, dynamic> body);
}
