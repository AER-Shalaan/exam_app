import 'package:exam_app/features/question/data/models/answer_model/answer_model.dart';
import 'package:exam_app/features/question/data/models/exam_model/exam_model.dart';
import 'package:exam_app/features/question/domain/entities/answer/answer_model_entity.dart';

class QuestionModelEntity {
  // do answer model entity ==>  toDomin in respone (AnswerModel)
  //

  final Type type;
  final String id;
  final String question;
  final CorrectModel correct;
  final dynamic subject;
  final ExamModel exam;
  final DateTime createdAt;
  final AnswerModelEntity? answermodelentity;

  QuestionModelEntity({
    this.answermodelentity,
    required this.type,
    required this.id,
    required this.question,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
  });
}
