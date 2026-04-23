import 'package:exam_app/features/home/data/models/subject.dart';

import '../../domain/entities/subject_entity.dart';

extension SubjectMapper on Subject {
  SubjectEntity toDomain() => SubjectEntity(
    id: id ?? '',
    name: name ?? '',
    icon: icon ?? '',
  );
}
