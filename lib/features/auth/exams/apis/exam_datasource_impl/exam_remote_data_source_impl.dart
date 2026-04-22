import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/exams/apis/api_client/exam_api_client.dart';
import 'package:exam_app/features/auth/exams/apis/response/exam_response.dart';
import 'package:exam_app/features/auth/exams/data/datasources/remote/exam_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ExamApiClient _apiClient;

  ExamRemoteDataSourceImpl(this._apiClient);

  @override
  Future<BaseResponse<ExamResponse>> getExams({String? subjectId}) async {
    try {
      final response = await _apiClient.getExams(subjectId: subjectId);
      return SuccessBaseResponse<ExamResponse>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<ExamResponse>(exception: e);
    }
  }
}
