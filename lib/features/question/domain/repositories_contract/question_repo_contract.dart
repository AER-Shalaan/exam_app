import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/api/request/post_add_question_request.dart';
import 'package:exam_app/features/question/data/models/answer_model/answer_model.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';

abstract class QuestionRepoContract {
   Future<BaseResponse<QuestionModelEntity>> getQuestionsOnExam(String token, String examId);
  Future<BaseResponse<void>> getQuestions();



  Future<BaseResponse<void>> getSingleQuestion(String token);

  Future<BaseResponse<void>> getUserHistory(String token);

  Future<BaseResponse<void>> postAddQuestion(
    postAddQuestionRequest addquestionrequest,
    String token,
  );

  Future<BaseResponse<void>> postChechQuestion(
    AnswerModel answermodel,
    String token,
  );
}
