import 'package:exam_app/features/question/data/models/answer_model/answer_model.dart';
import 'package:exam_app/features/question/domain/entities/answer/answer_model_entity.dart';

extension AnswerModelMapper on AnswerModel {
  AnswerModelEntity answerToEntity() => AnswerModelEntity(
        answer: answer,
        key: key,
      );
}
