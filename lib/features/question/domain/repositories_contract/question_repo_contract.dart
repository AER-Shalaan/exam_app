import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/data/models/check_questions/request/question_request.dart';
import 'package:exam_app/features/question/domain/entities/check_questions/check_questions_response/check_question_response_entity.dart';
import 'package:exam_app/features/question/domain/entities/questions/responce_entity/question_response_entity.dart';

abstract class QuestionRepoContract {
  Future<BaseResponse<QuestionResponseEntity>> getQuestionsOnExam(
      {required String examId});
  Future<BaseResponse<CheckQuestionsResponseEntity>> checkQuestions(
      {required QuestionRequest checkQuestionRequest});
}
