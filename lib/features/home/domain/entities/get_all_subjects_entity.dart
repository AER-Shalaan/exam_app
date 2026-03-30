import 'package:exam_app/features/home/domain/entities/subject_entity.dart';

class GetAllSubjectsEntity {
  final String message;
  final List<SubjectEntity> subjects;
  GetAllSubjectsEntity({required this.message, required this.subjects});
}
