import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/data/models/responce/question_response.dart';

abstract class QuestionDataSourceContract {
  Future<BaseResponse<List<QuestionResponse>>> getQuestionsOnExam(
      String token, String examId);

  // Future<BaseResponse<QuestionModel>> getAllQuestions(String token);

  // Future<BaseResponse<QuestionModel>> getSingleQuestion(String token);

  // Future<BaseResponse<QuestionModel>> getUserHistory(String token);

  // Future<BaseResponse<QuestionModel>> postAddQuestion(
  //   postAddQuestionRequest addquestionrequest,
  //   String token,
  // );

  // Future<BaseResponse<QuestionModel>> postChechQuestion(
  //   AnswerModel answermodel,
  //   String token,
  // );
}
