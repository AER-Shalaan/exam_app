// import 'package:json_annotation/json_annotation.dart';
// part 'exam_model.g.dart';
// @JsonSerializable()
// class ExamModel {
//     @JsonKey(name: "_id")
//     final Id id;
//     @JsonKey(name: "title")
//     final Title title;
//     @JsonKey(name: "duration")
//     final int duration;
//     @JsonKey(name: "subject")
//     final Subject subject;
//     @JsonKey(name: "numberOfQuestions")
//     final int numberOfQuestions;
//     @JsonKey(name: "active")
//     final bool active;
//     @JsonKey(name: "createdAt")
//     final DateTime createdAt;

//     ExamModel({
//         required this.id,
//         required this.title,
//         required this.duration,
//         required this.subject,
//         required this.numberOfQuestions,
//         required this.active,
//         required this.createdAt,
//     });

//     factory ExamModel.fromJson(Map<String, dynamic> json) => _$ExamModelFromJson(json);

//     Map<String, dynamic> toJson() => _$ExamModelToJson(this);
// }


// final typeValues = EnumValues({
//     "single_choice": QuestionType.singleChoice,
//     "multiple_choice": QuestionType.multipleChoice
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }
