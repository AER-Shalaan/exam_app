import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/api/request/post_add_question_request.dart';
import 'package:exam_app/features/question/data/models/answer_model.dart';
import 'package:exam_app/features/question/domain/repositories_contract/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionsUseCase {
  final QuestionRepoContract questionRepoContract;

  GetQuestionsUseCase(this.questionRepoContract);

  Future<BaseResponse<void>> call() => questionRepoContract.getQuestions();

  Future<BaseResponse<void>> callOnExam(String token, String examId) =>
      questionRepoContract.getQuestionsOnExam(token, examId);

  Future<BaseResponse<void>> callSingleQuestion(String token) =>
      questionRepoContract.getSingleQuestion(token);

  Future<BaseResponse<void>> callUserHistory(String token) =>
      questionRepoContract.getUserHistory(token);

  Future<BaseResponse<void>> callAddQuestion(
    postAddQuestionRequest addquestionrequest,
    String token,
  ) => questionRepoContract.postAddQuestion(addquestionrequest, token);

  Future<BaseResponse<void>> callCheckQuestion(
    AnswerModel answermodel,
    String token,
  ) => questionRepoContract.postChechQuestion(answermodel, token);
}
