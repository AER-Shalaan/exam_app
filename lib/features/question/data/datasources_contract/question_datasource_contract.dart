import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/api/request/post_add_question_request.dart';
import 'package:exam_app/features/question/data/models/answer_model.dart';
import 'package:exam_app/features/question/data/models/questions/questions_model.dart';

abstract class QuestionDataSourceContract {
  Future<BaseResponse<QuestionsModel>> getAllQuestions(String token);

  Future<BaseResponse<QuestionsModel>> getQuestionsOnExam(String token, String examId);

  Future<BaseResponse<QuestionsModel>> getSingleQuestion(String token);

  Future<BaseResponse<QuestionsModel>> getUserHistory(String token);

  Future<BaseResponse<QuestionsModel>> postAddQuestion(
    postAddQuestionRequest addquestionrequest,
    String token,
  );

  Future<BaseResponse<QuestionsModel>> postChechQuestion(
    AnswerModel answermodel,
    String token,
  );
}
