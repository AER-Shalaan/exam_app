import 'package:exam_app/features/question/data/models/check_questions/correct_question/correct_questions_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'check_questions_response.g.dart';
@JsonSerializable()
class CheckQuestionsResponse {
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

    CheckQuestionsResponse({
        this.message,
        this.correct,
        this.wrong,
        this.total,
        this.wrongQuestions,
        this.correctQuestions,
    });

    factory CheckQuestionsResponse.fromJson(Map<String, dynamic> json) => _$CheckQuestionsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$CheckQuestionsResponseToJson(this);
}




