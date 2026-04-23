import 'package:exam_app/features/question/data/models/check_questions/answers/answers_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'correct_questions_model.g.dart';

@JsonSerializable()
class CorrectQuestion {
  @JsonKey(name: "QID")
  String? qid;
  @JsonKey(name: "Question")
  String? question;
  @JsonKey(name: "correctAnswer")
  String? correctAnswer;
  @JsonKey(name: "answers")
  Answers? answers;

  CorrectQuestion({
    this.qid,
    this.question,
    this.correctAnswer,
    this.answers,
  });

  factory CorrectQuestion.fromJson(Map<String, dynamic> json) =>
      _$CorrectQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$CorrectQuestionToJson(this);
}
