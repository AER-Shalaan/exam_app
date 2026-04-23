import 'package:exam_app/features/question/domain/entities/questions/questions_entity/questions_model_entity.dart';

class QuestionResponseEntity {
  final String? message;
  final List<QuestionModelEntity>? questions;

  QuestionResponseEntity({
    required this.message,
    required this.questions,
  });

  QuestionResponseEntity copyWith({
    String? message,
    List<QuestionModelEntity>? questions,
  }) {
    return QuestionResponseEntity(
      message: message ?? this.message,
      questions: questions ?? this.questions,
    );
  }
}