import 'package:exam_app/features/home/data/models/metadata.dart';
import 'package:exam_app/features/home/data/models/subject.dart';
import 'package:exam_app/features/home/domain/entities/get_all_subjects_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_subjects_response.g.dart';

@JsonSerializable()
class GetAllSubjectsResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "subjects")
  List<Subject>? subjects;

  GetAllSubjectsResponse({this.message, this.metadata, this.subjects});

  GetAllSubjectsEntity toDomain() {
    return GetAllSubjectsEntity(
      message: message ?? '',
      subjects: subjects?.map((subject) => subject.toDomain()).toList() ?? [],
    );
  }

  factory GetAllSubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllSubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllSubjectsResponseToJson(this);
}
