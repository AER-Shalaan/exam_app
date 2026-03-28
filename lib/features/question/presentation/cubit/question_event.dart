import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';

sealed class QuestionEvent {}

class QuestionsUseCase extends QuestionEvent {
  String? token;
  String? examId;
  final QuestionModelEntity questionModelEntity;
  QuestionsUseCase({
    this.token,
    this.examId,
    required this.questionModelEntity,
  });
}
