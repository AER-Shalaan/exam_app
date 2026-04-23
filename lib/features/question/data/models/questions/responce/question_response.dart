import 'package:json_annotation/json_annotation.dart';
 part 'question_response.g.dart';

@JsonSerializable()
class QuestionsResponse {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "questions")
    List<QuestionModel>? questions;

    QuestionsResponse({
        this.message,
        this.questions,
    });

    factory QuestionsResponse.fromJson(Map<String, dynamic> json) => _$QuestionsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}

 enum QuestionType {
    @JsonValue("single_choice")
    singleChoice,
    @JsonValue("multiple_choice")
    multipleChoice
}
@JsonSerializable()
class QuestionModel {
    @JsonKey(name: "_id")
    String? id;
    @JsonKey(name: "question")
    String? question;
    @JsonKey(name: "answers")
    List<AnswerModel>? answers;
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "correct")
    CorrectModel? correct;
    @JsonKey(name: "subject")
    SubjectClass? subject;
    @JsonKey(name: "exam")
    ExamModel? exam;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;

    QuestionModel({
        this.id,
        this.question,
        this.answers,
        this.type,
        this.correct,
        this.subject,
        this.exam,
        this.createdAt,
    });

    factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

    Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}

@JsonSerializable()
class AnswerModel {
    @JsonKey(name: "answer")
    String? answer;
    @JsonKey(name: "key")
    CorrectModel? key;

    AnswerModel({
        this.answer,
        this.key,
    });

    factory AnswerModel.fromJson(Map<String, dynamic> json) => _$AnswerModelFromJson(json);

    Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}

enum CorrectModel {
    @JsonValue("A1")
    A1,
    @JsonValue("A2")
    A2,
    @JsonValue("A3")
    A3,
    @JsonValue("A4")
    A4
}

@JsonSerializable()
class ExamModel {
    @JsonKey(name: "_id")
    String? id;
    @JsonKey(name: "title")
    String? title;
    @JsonKey(name: "duration")
    int? duration;
    @JsonKey(name: "subject")
    String? subject;
    @JsonKey(name: "numberOfQuestions")
    int? numberOfQuestions;
    @JsonKey(name: "active")
    bool? active;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;

    ExamModel({
        this.id,
        this.title,
        this.duration,
        this.subject,
        this.numberOfQuestions,
        this.active,
        this.createdAt,
    });

    factory ExamModel.fromJson(Map<String, dynamic> json) => _$ExamModelFromJson(json);

    Map<String, dynamic> toJson() => _$ExamModelToJson(this);
}


@JsonSerializable()
class SubjectClass {
    @JsonKey(name: "_id")
    String? id;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "icon")
    String? icon;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;

    SubjectClass({
        this.id,
        this.name,
        this.icon,
        this.createdAt,
    });

    factory SubjectClass.fromJson(Map<String, dynamic> json) => _$SubjectClassFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectClassToJson(this);
}
