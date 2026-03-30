import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/data/models/responce/question_response.dart';

abstract class QuestionDataSourceContract {
  Future<BaseResponse<QuestionResponse>> getQuestionsOnExam(
      String token, String examId);

}
