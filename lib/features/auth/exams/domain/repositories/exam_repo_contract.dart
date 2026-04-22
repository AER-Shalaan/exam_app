import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/exams/domain/entities/exam_entity.dart';

abstract class ExamRepositoryContract {
  Future<BaseResponse<ExamResponseEntity>> getExams({String? subjectId});
}
