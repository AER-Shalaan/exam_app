import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/question/data/models/check_answer/post_check_answer_responce.dart';
import 'package:exam_app/features/question/data/models/responce/question_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'question_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class QuestionApiClient {
  @factoryMethod
  factory QuestionApiClient(Dio dio) = _QuestionApiClient;

  @GET(Endpoints.getAllQuestionInExamEndpoint)
  Future<QuestionResponse> getAllQuestiononExam(
    @Header("Authorization") String token,
    @Query("examId") String examId,
  );
}
