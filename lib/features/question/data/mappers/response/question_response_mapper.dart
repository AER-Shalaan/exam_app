import 'package:exam_app/features/question/data/mappers/questions/question_model_mapper.dart';
import 'package:exam_app/features/question/data/models/responce/question_response.dart';
import 'package:exam_app/features/question/domain/entities/responce/question_response_entity.dart';

extension QuestionResponseMapper on QuestionResponse {
  QuestionResponseEntity responseToEntity() => QuestionResponseEntity(
        message: message,
        questions: questions.map((question) => question.modelToEntity()).toList(),
      );
}
