import 'package:dio/dio.dart';
import 'package:exam_app/core/network/endpoints.dart';
import 'package:exam_app/features/question/data/models/answer_model/answer_model.dart';
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
  // هنا مش هيرجع لم list هنا هيرجع لك object فيه message و فيه list of question model
  Future<QuestionResponse> getAllQuestiononExam(
    @Header("Authorization") String token,
    @Query("examId") String examId,
  );


@POST(Endpoints.postCheckQuestionEndpoint)
 Future <List<PostcheckAnswer>>answerList(
   @Query(  "correct") String correct,
    @Query("questionId") String questionId
  );
  // محتاج تعمل endpoint check question و تبعت فيه ال list of answers اللي هتبعت فيها ال id بتاع السؤال و الاجابة اللي انت اخترتها و ال time بتاع الامتحان كله و هو هيقولك صح ولا غلط
}
