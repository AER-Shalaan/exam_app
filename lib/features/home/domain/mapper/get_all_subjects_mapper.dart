import 'package:exam_app/features/home/data/models/get_all_subjects_response.dart';
import 'package:exam_app/features/home/domain/mapper/subject_mapper.dart';

import '../../domain/entities/get_all_subjects_entity.dart';

extension GetAllSubjectsMapper on GetAllSubjectsResponse {
  GetAllSubjectsEntity toDomain() => GetAllSubjectsEntity(
    message: message ?? '',
    subjects: (subjects ?? []).map((subject) => subject.toDomain()).toList(),
  );
}
