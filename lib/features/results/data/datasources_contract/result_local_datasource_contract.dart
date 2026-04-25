import 'package:exam_app/features/results/data/models/exam_attempt_model.dart';

abstract interface class ResultLocalDataSourceContract {
  Future<void> saveExamAttempt(ExamAttemptModel attempt);
  Future<List<ExamAttemptModel>> getExamAttempts();
}