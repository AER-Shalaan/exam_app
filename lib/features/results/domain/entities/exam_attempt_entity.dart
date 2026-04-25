import 'package:exam_app/features/results/domain/entities/question_attempt_entity.dart';

class ExamAttemptEntity {
  String? examId;
  String? examTitle;
  String? subjectName;
  String? duration;
  int? examDuration;
  int? correctCount;
  int? wrongCount;
  int? total;
  List<QuestionAttemptEntity>? questions;

  ExamAttemptEntity({
    this.examId,
    this.examTitle,
    this.subjectName,
    this.duration,
    this.examDuration,
    this.correctCount,
    this.wrongCount,
    this.total,
    this.questions,
  });
}
