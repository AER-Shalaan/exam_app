

import 'dart:convert';

import 'package:exam_app/features/question/data/models/questions/question_model/question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_response.g.dart';

QuestionResponse questionResponseFromJson(String str) =>
    QuestionResponse.fromJson(json.decode(str));

String questionResponseToJson(QuestionResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class QuestionResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "questions")
  final List<QuestionModel> questions;
// toDomin in responce (QuestionResponse)=> in  todDomin(QuestionModel)
  QuestionResponse({required this.message, required this.questions});

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}
