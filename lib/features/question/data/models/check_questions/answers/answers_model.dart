import 'package:json_annotation/json_annotation.dart';
part 'answers_model.g.dart';
@JsonSerializable()
class Answers {
    Answers();

    factory Answers.fromJson(Map<String, dynamic> json) => _$AnswersFromJson(json);

    Map<String, dynamic> toJson() => _$AnswersToJson(this);
}
