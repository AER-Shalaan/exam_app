import 'package:exam_app/features/question/api/request/post_add_question_request.dart';
import 'package:exam_app/features/question/data/models/answer_model.dart';
import 'package:exam_app/features/question/data/models/questions/questions_model.dart';

abstract class QuestionDataSourceContract {
  Future<QuestionsModel> getAllQuestions(String token);

  Future<QuestionsModel> getQuestionsOnExam(String token, String examId);

  Future<QuestionsModel> getSingleQuestion(String token);

  Future<QuestionsModel> getUserHistory(String token);

  Future<QuestionsModel> postAddQuestion(
    postAddQuestionRequest addquestionrequest,
    String token,
  );

  Future<QuestionsModel> postChechQuestion(
    AnswerModel answermodel,
    String token,
  );
}
