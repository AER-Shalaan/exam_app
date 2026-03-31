import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/data/models/check_questions/request/question_request.dart';
import 'package:exam_app/features/question/domain/entities/check_questions/check_questions_response/check_question_response_entity.dart';
import 'package:exam_app/features/question/domain/entities/questions/responce_entity/question_response_entity.dart';
import 'package:exam_app/features/question/domain/repositories_contract/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionsUseCase {
  final QuestionRepoContract questionRepoContract;

  GetQuestionsUseCase(this.questionRepoContract);
  Future<BaseResponse<QuestionResponseEntity>> callOnExam(
          String token, String examId) =>
      questionRepoContract.getQuestionsOnExam(token: token, examId: examId);
  Future<BaseResponse<CheckQuestionsResponseEntity>> checkQuestionCall(
          String token, QuestionRequest checkQuestionRequest) =>
      questionRepoContract.checkQuestions(
          token: token, checkQuestionRequest: checkQuestionRequest);
}
