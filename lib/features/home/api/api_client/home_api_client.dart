import 'package:dio/dio.dart';
import 'package:exam_app/core/network/api_param.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/home/data/models/get_all_subjects_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_client.g.dart';

@injectable
@RestApi()
abstract interface class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(Endpoints.getAllSubjectsEndpoint)
  Future<GetAllSubjectsResponse> getAllSubjects(
    @Header(ApiParam.token) String token,
  );
}
