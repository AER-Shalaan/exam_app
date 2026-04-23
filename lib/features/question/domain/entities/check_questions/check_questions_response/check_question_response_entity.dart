import 'package:exam_app/features/question/domain/entities/check_questions/correct_questions/check_questions_entity.dart';

class CheckQuestionsResponseEntity {
  String? message;
  int? correct;
  int? wrong;
  String? total;
  List<dynamic>? wrongQuestions;
  List<CorrectQuestionEntity>? correctQuestions;

  CheckQuestionsResponseEntity({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });
}
