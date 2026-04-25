import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';

abstract interface class ResultRepoContract {
  Future<void> saveExamAttempt(ExamAttemptEntity attempt);
  Future<List<ExamAttemptEntity>> getExamAttempts();
}