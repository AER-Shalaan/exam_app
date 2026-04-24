import 'package:exam_app/features/question/data/models/questions/question_response.dart';
import 'package:exam_app/features/question/domain/entities/questions/exam/exam_model_entity.dart';

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
