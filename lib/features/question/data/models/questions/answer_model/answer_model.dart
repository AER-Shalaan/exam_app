// import 'package:exam_app/features/question/data/models/questions/exam_model/exam_model.dart';
// import 'package:json_annotation/json_annotation.dart';
// part 'answer_model.g.dart';
// @JsonSerializable()
// class AnswerModel {
//     @JsonKey(name: "answer")
//     final String answer;
//     @JsonKey(name: "key")
//     final CorrectModel key;

//     AnswerModel({
//         required this.answer,
//         required this.key,
//     });

//     factory AnswerModel.fromJson(Map<String, dynamic> json) => _$AnswerModelFromJson(json);

//     Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
// }


// enum CorrectModel {
//     @JsonValue("A1")
//     A1,
//     @JsonValue("A2")
//     A2,
//     @JsonValue("A3")
//     A3,
//     @JsonValue("A4")
//     A4,
//     @JsonValue("A5")
//     A5
// }

// final correctValues = EnumValues({
//     "A1": CorrectModel.A1,
//     "A2": CorrectModel.A2,
//     "A3": CorrectModel.A3,
//     "A4": CorrectModel.A4,
//     "A5": CorrectModel.A5
// });
