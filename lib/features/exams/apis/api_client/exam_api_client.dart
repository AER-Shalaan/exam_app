import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/exams/apis/response/exam_response.dart';
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
    @Query('subject') String? subjectId,
  });
}
