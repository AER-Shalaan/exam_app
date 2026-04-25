import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/repositories_contract/result_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamAttemptsUseCase {
  final ResultRepoContract repo;

  GetExamAttemptsUseCase(this.repo);

  Future<List<ExamAttemptEntity>> call() {
    return repo.getExamAttempts();
  }
}