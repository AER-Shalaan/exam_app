import 'package:exam_app/features/question/data/models/questions/responce/question_response.dart';
import 'package:exam_app/features/question/domain/entities/questions/answer/answer_model_entity.dart';

class QuestionModelEntity {
  final String type;
  final String id;
  final String question;
  final CorrectModel correct;
  final dynamic subject;
  final ExamModel exam;
  final DateTime? createdAt;
  final List<AnswerModelEntity> answers;
  final Set<CorrectModel> selectedAnswerKeys;

  QuestionModelEntity({
    required this.type,
    required this.id,
    required this.question,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
    required this.answers,
    Set<CorrectModel>? selectedAnswerKeys,
  }) : selectedAnswerKeys = selectedAnswerKeys ?? <CorrectModel>{};
}
