import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/home/domain/entities/get_all_subjects_entity.dart';

abstract class HomeRepositoriesContract {
  Future<BaseResponse<GetAllSubjectsEntity>> getAllSubjects({
    required String token,
  });
}
