import 'package:exam_app/features/question/data/mappers/check_questions/correct_questions/correct_question_mappers.dart';
import 'package:exam_app/features/question/data/models/check_questions/response/check_questions_response.dart';
import 'package:exam_app/features/question/domain/entities/check_questions/check_questions_response/check_question_response_entity.dart';

extension CheckQuestionResponseMapper on CheckQuestionsResponse {
  CheckQuestionsResponseEntity responseToEntity() =>
      CheckQuestionsResponseEntity(
        message: message,
        correct: correct,
        wrong: wrong,
        total: total,
        wrongQuestions: wrongQuestions,
        correctQuestions: correctQuestions
            ?.map((question) => question.correctQuestionToEntity())
            .toList(),
      );
}
