import 'package:exam_app/features/question/api/request/post_add_question_request.dart';
import 'package:exam_app/features/question/data/models/answer_model.dart';

abstract class QuestionRepoContract {

  Future<void> getQuestions();

  Future<void> getQuestionsOnExam(String token, String examId);

  Future<void> getSingleQuestion(String token);

  Future<void> getUserHistory(String token);

  Future<void> postAddQuestion(postAddQuestionRequest addquestionrequest, String token);

  Future<void> postChechQuestion(AnswerModel answermodel, String token);

}
