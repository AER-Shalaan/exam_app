import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
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
  Future<List<QuestionResponse>> getAllQuestiononExam(
    @Header("Authorization") String token,
    @Query("examId") String examId,
  );
//   @GET(Endpoints.getAllQuestionEndpoint)
//   Future<List<String>> getAllQuestion(@Header("Authorization") String token);
//   @GET(Endpoints.getSingleQuestionEndpoint)
//   Future<List<String>> getSingleQuestion(@Header("Authorization") String token);
//   @GET(Endpoints.getUserHistoryEndpoint)
//   Future<List<String>> getUserHistory(@Header("Authorization") String token);
//   @POST(Endpoints.postAddQuestionEndpoint)
//   Future<List<String>> addQuestion(
//     @Body() Map<String, dynamic> request,
//     @Header("Authorization") String token,
//   );
//   @POST(Endpoints.postCheckQuestionEndpoint)
//   Future<List<String>> postChechQuestion(
//     @Body() Map<String, dynamic> request,
//     @Header("Authorization") String token,
//   );
}
