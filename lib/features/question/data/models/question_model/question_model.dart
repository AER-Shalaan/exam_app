import 'package:exam_app/features/question/data/models/answer_model/answer_model.dart';
import 'package:exam_app/features/question/data/models/exam_model/exam_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: "answers")
  final List<AnswerModel> answers;
  @JsonKey(name: "type")
  final Type type;
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "question")
  final String question;
  @JsonKey(name: "correct")
  final CorrectModel correct;
  @JsonKey(name: "subject")
  final dynamic subject;
  @JsonKey(name: "exam")
  final ExamModel exam;
  @JsonKey(name: "createdAt")
  final DateTime createdAt;

  QuestionModel({
    required this.answers,
    required this.type,
    required this.id,
    required this.question,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
