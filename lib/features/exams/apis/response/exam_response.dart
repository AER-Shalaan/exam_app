import 'package:exam_app/features/question/data/models/questions/responce/question_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_response.g.dart';

@JsonSerializable()
class ExamResponse {
  final String? message;
  final ExamMetadataModel? metadata;
  final List<ExamModel>? exams;

  ExamResponse({this.message, this.metadata, this.exams});

  factory ExamResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ExamResponseToJson(this);
}

@JsonSerializable()
class ExamMetadataModel {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  ExamMetadataModel({this.currentPage, this.numberOfPages, this.limit});

  factory ExamMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$ExamMetadataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExamMetadataModelToJson(this);
}

// @JsonSerializable()
// class ExamModel {
//   @JsonKey(name: '_id')
//   final String? id;
//   final String? title;
//   final int? duration;
//   final String? subject;
//   final int? numberOfQuestions;
//   final bool? active;
//   final String? createdAt;

//   ExamModel({
//     this.id,
//     this.title,
//     this.duration,
//     this.subject,
//     this.numberOfQuestions,
//     this.active,
//     this.createdAt,
//   });

//   factory ExamModel.fromJson(Map<String, dynamic> json) =>
//       _$ExamModelFromJson(json);
//   Map<String, dynamic> toJson() => _$ExamModelToJson(this);
// }
