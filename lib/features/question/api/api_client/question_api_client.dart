import 'package:dio/dio.dart';
import 'package:exam_app/core/network/api_param.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/question/data/models/check_questions/response/check_questions_response.dart';
import 'package:exam_app/features/question/data/models/questions/responce/question_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'question_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class QuestionApiClient {
  @factoryMethod
  factory QuestionApiClient(Dio dio) = _QuestionApiClient;

  @GET(Endpoints.getAllQuestiononExamEndpoint)
  Future<QuestionsResponse> getAllQuestiononExam(
    @Query(ApiParam.exam) String examId,
  );
  // @POST(Endpoints.postCheckQuestionEndpoint)
  // Future<CheckQuestionsResponse>checkQuestions(
  //   @Body()Map<String,dynamic>checkQuestionRequest,

  // );
}
