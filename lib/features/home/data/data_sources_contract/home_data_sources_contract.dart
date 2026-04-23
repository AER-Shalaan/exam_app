import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/home/data/models/get_all_subjects_response.dart';

abstract interface class HomeDataSourcesContract {
  Future<BaseResponse<GetAllSubjectsResponse>> getAllSubjects({
    required String token,
  });
}
