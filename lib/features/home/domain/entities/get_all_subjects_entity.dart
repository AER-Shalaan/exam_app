import 'package:equatable/equatable.dart';
import 'package:exam_app/features/home/domain/entities/subject_entity.dart';

class GetAllSubjectsEntity extends Equatable {
  final String message;
  final List<SubjectEntity> subjects;
  const GetAllSubjectsEntity({required this.message, required this.subjects});

  @override
  List<Object?> get props => [message, subjects];
}
