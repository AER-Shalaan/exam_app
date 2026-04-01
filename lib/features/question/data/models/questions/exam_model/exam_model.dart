import 'package:json_annotation/json_annotation.dart';
part 'exam_model.g.dart';
@JsonSerializable()
class ExamModel {
    @JsonKey(name: "_id")
    final Id id;
    @JsonKey(name: "title")
    final Title title;
    @JsonKey(name: "duration")
    final int duration;
    @JsonKey(name: "subject")
    final Subject subject;
    @JsonKey(name: "numberOfQuestions")
    final int numberOfQuestions;
    @JsonKey(name: "active")
    final bool active;
    @JsonKey(name: "createdAt")
    final DateTime createdAt;

    ExamModel({
        required this.id,
        required this.title,
        required this.duration,
        required this.subject,
        required this.numberOfQuestions,
        required this.active,
        required this.createdAt,
    });

    factory ExamModel.fromJson(Map<String, dynamic> json) => _$ExamModelFromJson(json);

    Map<String, dynamic> toJson() => _$ExamModelToJson(this);
}

enum Id {
    @JsonValue("6700707030a3c3c1944a9c5d")
    THE_6700707030_A3_C3_C1944_A9_C5_D,
    @JsonValue("6700708d30a3c3c1944a9c60")
    THE_6700708_D30_A3_C3_C1944_A9_C60,
    @JsonValue("670070a830a3c3c1944a9c63")
    THE_670070_A830_A3_C3_C1944_A9_C63
}

final idValues = EnumValues({
    "6700707030a3c3c1944a9c5d": Id.THE_6700707030_A3_C3_C1944_A9_C5_D,
    "6700708d30a3c3c1944a9c60": Id.THE_6700708_D30_A3_C3_C1944_A9_C60,
    "670070a830a3c3c1944a9c63": Id.THE_670070_A830_A3_C3_C1944_A9_C63
});

enum Subject {
    @JsonValue("670037f6728c92b7fdf434fc")
    THE_670037_F6728_C92_B7_FDF434_FC,
    @JsonValue("670038f7728c92b7fdf43501")
    THE_670038_F7728_C92_B7_FDF43501,
    @JsonValue("670039c3728c92b7fdf43506")
    THE_670039_C3728_C92_B7_FDF43506
}

final subjectValues = EnumValues({
    "670037f6728c92b7fdf434fc": Subject.THE_670037_F6728_C92_B7_FDF434_FC,
    "670038f7728c92b7fdf43501": Subject.THE_670038_F7728_C92_B7_FDF43501,
    "670039c3728c92b7fdf43506": Subject.THE_670039_C3728_C92_B7_FDF43506
});

enum Title {
    @JsonValue("CSS Quiz")
    CSS_QUIZ,
    @JsonValue("HTML Quiz")
    HTML_QUIZ,
    @JsonValue("JavaScript Quiz")
    JAVA_SCRIPT_QUIZ
}

final titleValues = EnumValues({
    "CSS Quiz": Title.CSS_QUIZ,
    "HTML Quiz": Title.HTML_QUIZ,
    "JavaScript Quiz": Title.JAVA_SCRIPT_QUIZ
});

enum QuestionType {
    @JsonValue("single_choice")
    singleChoice,
    @JsonValue("multiple_choice")
    multipleChoice
}

final typeValues = EnumValues({
    "single_choice": QuestionType.singleChoice,
    "multiple_choice": QuestionType.multipleChoice
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
