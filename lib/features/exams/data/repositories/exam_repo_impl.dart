import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/exams/apis/response/exam_response.dart';
import 'package:exam_app/features/exams/data/datasources/remote/exam_remote_data_source.dart';
import 'package:exam_app/features/exams/data/mappers/exam_mapper.dart';
import 'package:exam_app/features/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/exams/domain/repositories/exam_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamRepositoryContract)
class ExamRepositoryImpl implements ExamRepositoryContract {
  final ExamRemoteDataSource _remoteDataSource;

  ExamRepositoryImpl(this._remoteDataSource);

  @override
  Future<BaseResponse<ExamResponseEntity>> getExams({required String subjectId}) async {
    final response = await _remoteDataSource.getExams(subjectId: subjectId);

    switch (response) {
      case SuccessBaseResponse<ExamResponse>():
        final data = response.data.toEntity();
        return SuccessBaseResponse<ExamResponseEntity>(data: data);
      case ErrorBaseResponse<ExamResponse>():
        return ErrorBaseResponse<ExamResponseEntity>(exception: response.exception);
    }
  }
}
