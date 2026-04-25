import 'package:exam_app/features/results/data/datasources_contract/result_local_datasource_contract.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/mappers/exam_attempt_entity_mapper.dart';
import 'package:exam_app/features/results/domain/mappers/exam_attempt_mapper.dart';
import 'package:exam_app/features/results/domain/repositories_contract/result_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResultRepoContract)
class ResultRepoImpl implements ResultRepoContract {
  final ResultLocalDataSourceContract local;

  ResultRepoImpl(this.local);

  @override
  Future<void> saveExamAttempt(ExamAttemptEntity entity) async {
    await local.saveExamAttempt(entity.toModel());
  }

  @override
  Future<List<ExamAttemptEntity>> getExamAttempts() async {
    final models = await local.getExamAttempts();
    return models.map((e) => e.toEntity()).toList();
  }
}
