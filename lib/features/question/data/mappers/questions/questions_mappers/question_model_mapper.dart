import 'package:exam_app/features/question/data/mappers/questions/answer/answer_model_mapper.dart';
import 'package:exam_app/features/question/data/models/questions/question_model/question_model.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_entity/questions_model_entity.dart';

extension QuestionModelMapper on QuestionModel {
  QuestionModelEntity modelToEntity() => QuestionModelEntity(
        answermodelentity:
            answers.isNotEmpty ? answers.first.answerToEntity() : null,
        id: id,
        question: question,
        type: type,
        correct: correct,
        subject: subject,
        exam: exam,
        createdAt: createdAt,
      );
}
