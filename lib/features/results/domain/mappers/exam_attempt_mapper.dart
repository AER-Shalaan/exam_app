import 'package:exam_app/features/results/data/models/exam_attempt_model.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/entities/question_attempt_entity.dart';

extension ExamAttemptMapper on ExamAttemptModel {
  ExamAttemptEntity toEntity() => ExamAttemptEntity(
    examId: examId,
    examTitle: examTitle,
    subjectName: subjectName,
    duration: duration,
    examDuration: examDuration,
    correctCount: correctCount,
    wrongCount: wrongCount,
    total: total,
    questions: questions
        .map(
          (q) => QuestionAttemptEntity(
            questionId: q.questionId,
            question: q.question,
            selectedAnswer: q.selectedAnswer,
            correctAnswer: q.correctAnswer,
            answers: q.answers,
          ),
        )
        .toList(),
  );
}
