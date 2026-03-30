// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_check_answer_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostcheckAnswer _$PostcheckAnswerFromJson(Map<String, dynamic> json) =>
    PostcheckAnswer(
      message: json['message'] as String?,
      correct: (json['correct'] as num?)?.toInt(),
      wrong: (json['wrong'] as num?)?.toInt(),
      total: json['total'] as String?,
      wrongQuestions: json['WrongQuestions'] as List<dynamic>?,
      correctQuestions: (json['correctQuestions'] as List<dynamic>?)
          ?.map((e) => CorrectQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostcheckAnswerToJson(PostcheckAnswer instance) =>
    <String, dynamic>{
      'message': instance.message,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'total': instance.total,
      'WrongQuestions': instance.wrongQuestions,
      'correctQuestions': instance.correctQuestions,
    };

CorrectQuestion _$CorrectQuestionFromJson(Map<String, dynamic> json) =>
    CorrectQuestion(
      qid: json['QID'] as String?,
      question: json['Question'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'] == null
          ? null
          : Answers.fromJson(json['answers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CorrectQuestionToJson(CorrectQuestion instance) =>
    <String, dynamic>{
      'QID': instance.qid,
      'Question': instance.question,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };

Answers _$AnswersFromJson(Map<String, dynamic> json) => Answers();

Map<String, dynamic> _$AnswersToJson(Answers instance) => <String, dynamic>{};
