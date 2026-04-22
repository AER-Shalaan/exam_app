import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/exams/apis/response/exam_response.dart';

abstract interface class ExamRemoteDataSource {
  Future<BaseResponse<ExamResponse>> getExams({String? subjectId});
}
