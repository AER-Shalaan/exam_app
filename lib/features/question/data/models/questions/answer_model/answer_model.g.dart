// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
      answer: json['answer'] as String,
      key: $enumDecode(_$CorrectModelEnumMap, json['key']),
    );

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'key': _$CorrectModelEnumMap[instance.key]!,
    };

const _$CorrectModelEnumMap = {
  CorrectModel.A1: 'A1',
  CorrectModel.A2: 'A2',
  CorrectModel.A3: 'A3',
  CorrectModel.A4: 'A4',
  CorrectModel.A5: 'A5',
};
