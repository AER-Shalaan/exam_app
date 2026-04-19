import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/exams/apis/response/exam_response.dart';

abstract class ExamRemoteDataSource {
  Future<BaseResponse<ExamResponse>> getExams({String? subjectId});
}
