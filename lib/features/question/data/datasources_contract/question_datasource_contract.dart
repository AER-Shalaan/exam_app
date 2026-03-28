import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/api/request/post_add_question_request.dart';
import 'package:exam_app/features/question/data/models/answer_model/answer_model.dart';
import 'package:exam_app/features/question/data/models/question_model/question_model.dart';

abstract class QuestionDataSourceContract {
  Future<BaseResponse<QuestionModel>> getAllQuestions(String token);

  Future<BaseResponse<List<QuestionModel>>> getQuestionsOnExam(
      String token, String examId);

  Future<BaseResponse<QuestionModel>> getSingleQuestion(String token);

  Future<BaseResponse<QuestionModel>> getUserHistory(String token);

  Future<BaseResponse<QuestionModel>> postAddQuestion(
    postAddQuestionRequest addquestionrequest,
    String token,
  );

  Future<BaseResponse<QuestionModel>> postChechQuestion(
    AnswerModel answermodel,
    String token,
  );
}
