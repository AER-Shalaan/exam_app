import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';
import 'package:exam_app/features/question/domain/repositories_contract/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionsUseCase {
  final QuestionRepoContract questionRepoContract;

  GetQuestionsUseCase(this.questionRepoContract);
  Future<BaseResponse<QuestionModelEntity>> callOnExam(String token, String examId) =>
      questionRepoContract.getQuestionsOnExam(token, examId);


}
