import 'package:json_annotation/json_annotation.dart';
part 'post_check_answer_responce.g.dart';
@JsonSerializable()
class PostcheckAnswer {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "correct")
    int? correct;
    @JsonKey(name: "wrong")
    int? wrong;
    @JsonKey(name: "total")
    String? total;
    @JsonKey(name: "WrongQuestions")
    List<dynamic>? wrongQuestions;
    @JsonKey(name: "correctQuestions")
    List<CorrectQuestion>? correctQuestions;

    PostcheckAnswer({
        this.message,
        this.correct,
        this.wrong,
        this.total,
        this.wrongQuestions,
        this.correctQuestions,
    });

    factory PostcheckAnswer.fromJson(Map<String, dynamic> json) => _$PostcheckAnswerFromJson(json);

    Map<String, dynamic> toJson() => _$PostcheckAnswerToJson(this);
}

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

    factory CorrectQuestion.fromJson(Map<String, dynamic> json) => _$CorrectQuestionFromJson(json);

    Map<String, dynamic> toJson() => _$CorrectQuestionToJson(this);
}

@JsonSerializable()
class Answers {
    Answers();

    factory Answers.fromJson(Map<String, dynamic> json) => _$AnswersFromJson(json);

    Map<String, dynamic> toJson() => _$AnswersToJson(this);
}
