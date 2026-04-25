import 'package:exam_app/features/results/data/datasources_contract/result_local_datasource_contract.dart';
import 'package:exam_app/features/results/data/models/exam_attempt_model.dart';
import 'package:exam_app/features/results/data/models/question_attempt_model.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/mappers/exam_attempt_mapper.dart';
import 'package:exam_app/features/results/domain/repositories_contract/result_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResultRepoContract)
class ResultRepoImpl implements ResultRepoContract {
  final ResultLocalDataSourceContract local;

  ResultRepoImpl(this.local);

  @override
  Future<void> saveExamAttempt(ExamAttemptEntity entity) async {
    final model = ExamAttemptModel(
      examId: entity.examId,
      examTitle: entity.examTitle,
      subjectName: entity.subjectName,
      duration: entity.duration,
      examDuration: entity.examDuration,
      correctCount: entity.correctCount,
      wrongCount: entity.wrongCount,
      total: entity.total,
      questions:
          entity.questions
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
    await local.saveExamAttempt(model);
  }

  @override
  Future<List<ExamAttemptEntity>> getExamAttempts() async {
    final models = await local.getExamAttempts();
    return models.map((e) => e.toEntity()).toList();
  }
}
