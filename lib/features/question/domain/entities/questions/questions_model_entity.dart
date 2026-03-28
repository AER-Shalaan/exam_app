import 'package:exam_app/features/question/data/models/answer_model/answer_model.dart';
import 'package:exam_app/features/question/data/models/exam_model/exam_model.dart';
import 'package:exam_app/features/question/domain/entities/responce/question_response_entity.dart';

class QuestionModelEntity {
  final List<AnswerModel> answers;
  final Type type;
  final String id;
  final String question;
  final CorrectModel correct;
  final dynamic subject;
  final ExamModel exam;
  final DateTime createdAt;
  QuestionResponseEntity? questionResponseEntity;

  QuestionModelEntity(
      {required this.answers,
      required this.type,
      required this.id,
      required this.question,
      required this.correct,
      required this.subject,
      required this.exam,
      required this.createdAt,
      this.questionResponseEntity});
}
