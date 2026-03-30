import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';

abstract class QuestionRepoContract {
  Future<BaseResponse<QuestionModelEntity>> getQuestionsOnExam(
      String token, String examId);
  
}
