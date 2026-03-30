import 'package:exam_app/features/home/domain/entities/subject_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subject.g.dart';

@JsonSerializable()
class Subject {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "icon")
  String? icon;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  Subject({this.id, this.name, this.icon, this.createdAt});
  SubjectEntity toDomain() {
    return SubjectEntity(
      id: id ?? '',
      name: name ?? '',
      icon: icon ?? '',
    );
  }
  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
