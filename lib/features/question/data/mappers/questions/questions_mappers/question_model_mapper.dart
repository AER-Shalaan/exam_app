import 'package:exam_app/features/question/data/mappers/questions/answer/answer_model_mapper.dart';
import 'package:exam_app/features/question/data/models/questions/responce/question_response.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_entity/questions_model_entity.dart';

extension QuestionModelMapper on QuestionModel {
  QuestionModelEntity modelToEntity() => QuestionModelEntity(
        type: type ?? '',
        id: id ?? '',
        question: question ?? '',
        correct: correct ?? CorrectModel.A1,
        subject: subject,
        exam: exam ?? ExamModel(),
        createdAt: createdAt ,
        answers: answers?.map((answer) => answer.answerToEntity()).toList() ?? [],
      );
}
