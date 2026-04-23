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
  Future<BaseResponse<QuestionResponseEntity>> callOnExam(String examId) =>
      questionRepoContract.getQuestionsOnExam(examId: examId);
  // Future<BaseResponse<CheckQuestionsResponseEntity>> checkQuestionCall(
  //         QuestionRequest checkQuestionRequest) =>
  //     questionRepoContract.checkQuestions(
  //         checkQuestionRequest: checkQuestionRequest);
}
