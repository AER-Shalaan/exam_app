import 'package:exam_app/features/results/data/models/question_attempt_model.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/data/models/exam_attempt_model.dart';

extension ExamAttemptEntityMapper on ExamAttemptEntity {
  ExamAttemptModel toModel() => ExamAttemptModel(
    examId: examId,
    examTitle: examTitle,
    subjectName: subjectName,
    duration: duration,
    examDuration: examDuration,
    correctCount: correctCount,
    wrongCount: wrongCount,
    total: total,
    questions:
        questions
            ?.map(
              (q) => QuestionAttemptModel(
                questionId: q.questionId,
                question: q.question,
                selectedAnswer: q.selectedAnswer,
                correctAnswer: q.correctAnswer,
                answers: q.answers ?? [],
              ),
            )
            .toList() ??
        [],
  );
}
