import 'package:exam_app/core/auth/token_manager.dart';
import 'package:exam_app/features/results/data/datasources_contract/result_local_datasource_contract.dart';
import 'package:exam_app/features/results/data/models/exam_attempt_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResultLocalDataSourceContract)
class ResultLocalDataSourceImpl implements ResultLocalDataSourceContract {
  final Box<ExamAttemptModel> box;

  ResultLocalDataSourceImpl(this.box);

  @override
  Future<void> saveExamAttempt(ExamAttemptModel attempt) async {
     attempt.userId = TokenManager.userId;
    await box.add(attempt);
  }

  @override
  Future<List<ExamAttemptModel>> getExamAttempts() async {
    return box.values
      .where((e) => e.userId == TokenManager.userId)
      .toList();
  }
}
