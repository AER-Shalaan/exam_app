import 'package:dio/dio.dart';
import 'package:exam_app/core/network/api_param.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/auth/exams/apis/response/exam_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'exam_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio) = _ExamApiClient;

  @GET(Endpoints.getAllExamsEndpoint)
  Future<ExamResponse> getExams({
    @Query(ApiParam.subjectQueryken) String? subjectId,
  });
}
