import 'package:exam_app/features/question/data/models/exam_model/exam_model.dart';
import 'package:exam_app/features/question/domain/entities/exam/exam_model_entity.dart';

extension ExamModelMapper on ExamModel {
  ExamModelEntity answerToEntity() => ExamModelEntity(
      id: id.toString(),
      title: title.toString(),
      duration: duration,
      subject: subject.name,
      numberOfQuestions: numberOfQuestions,
      active: active,
      createdAt: createdAt,
    );
}
