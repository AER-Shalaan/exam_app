// To parse this JSON data, do
//
//     final getAllQuestionResponse = getAllQuestionResponseFromJson(jsonString);

import 'dart:convert';

import 'package:exam_app/features/question/data/models/question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

GetAllQuestionResponse getAllQuestionResponseFromJson(String str) =>
    GetAllQuestionResponse.fromJson(json.decode(str));

String getAllQuestionResponseToJson(GetAllQuestionResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetAllQuestionResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "questions")
  final List<QuestionModel> questions;

  GetAllQuestionResponse({required this.message, required this.questions});

  factory GetAllQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllQuestionResponseToJson(this);
}
