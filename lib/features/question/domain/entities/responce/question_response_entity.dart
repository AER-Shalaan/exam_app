import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';

class QuestionResponseEntity {
  final String? message;
  QuestionModelEntity? questions;

  QuestionResponseEntity({required this.message, this.questions});
}
