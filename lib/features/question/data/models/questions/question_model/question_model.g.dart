// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      id: json['_id'] as String,
      question: json['question'] as String,
      correct: $enumDecode(_$CorrectModelEnumMap, json['correct']),
      subject: json['subject'],
      exam: ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'answers': instance.answers,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      '_id': instance.id,
      'question': instance.question,
      'correct': _$CorrectModelEnumMap[instance.correct]!,
      'subject': instance.subject,
      'exam': instance.exam,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$QuestionTypeEnumMap = {
  QuestionType.singleChoice: 'single_choice',
  QuestionType.multipleChoice: 'multiple_choice',
};

const _$CorrectModelEnumMap = {
  CorrectModel.A1: 'A1',
  CorrectModel.A2: 'A2',
  CorrectModel.A3: 'A3',
  CorrectModel.A4: 'A4',
  CorrectModel.A5: 'A5',
};
