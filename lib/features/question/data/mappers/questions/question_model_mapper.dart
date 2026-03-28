import 'package:exam_app/features/question/data/models/question_model/question_model.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';

extension QuestionModelMapper on QuestionModel {
  QuestionModelEntity modelToEntity() => QuestionModelEntity(
      id: id,
      question: question,
      type: type,
      answers: answers,
      correct: correct,
      subject: subject,
      exam: exam,
      createdAt: createdAt);
}
