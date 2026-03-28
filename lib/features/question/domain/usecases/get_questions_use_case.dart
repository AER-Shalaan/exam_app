import 'package:exam_app/features/question/api/request/post_add_question_request.dart';
import 'package:exam_app/features/question/data/models/answer_model.dart';
import 'package:exam_app/features/question/domain/repositories_contract/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionsUseCase {
  final QuestionRepoContract questionRepoContract;

  GetQuestionsUseCase(this.questionRepoContract);

  Future<void> call() => questionRepoContract.getQuestions();

  Future<void> callOnExam(String token, String examId) =>
      questionRepoContract.getQuestionsOnExam(token, examId);

  Future<void> callSingleQuestion(String token) =>
      questionRepoContract.getSingleQuestion(token);

  Future<void> callUserHistory(String token) =>
      questionRepoContract.getUserHistory(token);

  Future<void> callAddQuestion(postAddQuestionRequest addquestionrequest, String token) =>
      questionRepoContract.postAddQuestion(addquestionrequest, token);

  Future<void> callCheckQuestion(AnswerModel answermodel, String token) =>
      questionRepoContract.postChechQuestion(answermodel, token);

}
