import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/domain/entities/responce/question_response_entity.dart';

abstract class QuestionRepoContract {
  Future<BaseResponse<QuestionResponseEntity>> getQuestionsOnExam(
      String token, String examId);
}
