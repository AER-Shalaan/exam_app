// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamModel _$ExamModelFromJson(Map<String, dynamic> json) => ExamModel(
      id: $enumDecode(_$IdEnumMap, json['_id']),
      title: $enumDecode(_$TitleEnumMap, json['title']),
      duration: (json['duration'] as num).toInt(),
      subject: $enumDecode(_$SubjectEnumMap, json['subject']),
      numberOfQuestions: (json['numberOfQuestions'] as num).toInt(),
      active: json['active'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ExamModelToJson(ExamModel instance) => <String, dynamic>{
      '_id': _$IdEnumMap[instance.id]!,
      'title': _$TitleEnumMap[instance.title]!,
      'duration': instance.duration,
      'subject': _$SubjectEnumMap[instance.subject]!,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$IdEnumMap = {
  Id.THE_6700707030_A3_C3_C1944_A9_C5_D: '6700707030a3c3c1944a9c5d',
  Id.THE_6700708_D30_A3_C3_C1944_A9_C60: '6700708d30a3c3c1944a9c60',
  Id.THE_670070_A830_A3_C3_C1944_A9_C63: '670070a830a3c3c1944a9c63',
};

const _$TitleEnumMap = {
  Title.CSS_QUIZ: 'CSS Quiz',
  Title.HTML_QUIZ: 'HTML Quiz',
  Title.JAVA_SCRIPT_QUIZ: 'JavaScript Quiz',
};

const _$SubjectEnumMap = {
  Subject.THE_670037_F6728_C92_B7_FDF434_FC: '670037f6728c92b7fdf434fc',
  Subject.THE_670038_F7728_C92_B7_FDF43501: '670038f7728c92b7fdf43501',
  Subject.THE_670039_C3728_C92_B7_FDF43506: '670039c3728c92b7fdf43506',
};
