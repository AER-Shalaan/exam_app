import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/data/models/check_questions/request/question_request.dart';
import 'package:exam_app/features/question/data/models/check_questions/response/check_questions_response.dart';
import 'package:exam_app/features/question/data/models/questions/responce/question_response.dart';

abstract class QuestionDataSourceContract {
  Future<BaseResponse<QuestionsResponse>> getQuestionsOnExam(
      {required String examId});
  Future<BaseResponse<CheckQuestionsResponse>> checkQuestions(
      {required QuestionRequest checkQuestionRequest});
}
