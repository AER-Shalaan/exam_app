import 'package:exam_app/features/question/data/models/answer_model/answer_model.dart';
import 'package:exam_app/features/question/domain/entities/exam/exam_model_entity.dart';

class AnswerModelEntity {
  final String answer;
  final String? correct;
  final String? questionId;
  final CorrectModel key;
  final ExamModelEntity? exammodelentity;

  AnswerModelEntity({
    this.exammodelentity,
    required this.answer,
    this.correct,
    this.questionId,
    required this.key,
  });
}
