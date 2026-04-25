import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';

sealed class ResultEvent {}

class LoadResultsEvent extends ResultEvent {}

class SaveResultEvent extends ResultEvent {
  final ExamAttemptEntity attempt;
  SaveResultEvent(this.attempt);
}