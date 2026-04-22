import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/auth/exams/domain/repositories/exam_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamsUseCase {
  final ExamRepositoryContract _repository;

  GetExamsUseCase(this._repository);

  Future<BaseResponse<ExamResponseEntity>> call({String? subjectId}) {
    return _repository.getExams(subjectId: subjectId);
  }
}
