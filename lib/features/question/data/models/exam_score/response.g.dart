// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllQuestionResponse _$GetAllQuestionResponseFromJson(
  Map<String, dynamic> json,
) => GetAllQuestionResponse(
  message: json['message'] as String,
  questions: (json['questions'] as List<dynamic>)
      .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetAllQuestionResponseToJson(
  GetAllQuestionResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'questions': instance.questions,
};
