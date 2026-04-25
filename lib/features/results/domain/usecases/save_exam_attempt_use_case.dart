import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/repositories_contract/result_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveExamAttemptUseCase {
  final ResultRepoContract repo;

  SaveExamAttemptUseCase(this.repo);

  Future<void> call(ExamAttemptEntity attempt) {
    return repo.saveExamAttempt(attempt);
  }
}