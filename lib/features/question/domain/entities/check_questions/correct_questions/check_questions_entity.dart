import 'package:exam_app/features/question/data/models/check_questions/answers/answers_model.dart';

class CorrectQuestionEntity {
  String? qid;
  String? question;
  String? correctAnswer;
  Answers? answers;

  CorrectQuestionEntity({
    this.qid,
    this.question,
    this.correctAnswer,
    this.answers,
  });
}
