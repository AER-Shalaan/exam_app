import 'package:exam_app/features/question/data/models/questions/question_response.dart';
import 'package:exam_app/features/question/domain/entities/questions/answer/answer_model_entity.dart';

extension AnswerModelMapper on AnswerModel {
  AnswerModelEntity answerToEntity() => AnswerModelEntity(
        answer: answer ?? '',
        key: key ?? CorrectModel.A1,
      );
}
