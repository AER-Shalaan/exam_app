import 'package:exam_app/features/question/data/mappers/questions/questions_mappers/question_model_mapper.dart';
import 'package:exam_app/features/question/data/models/questions/question_response.dart';
import 'package:exam_app/features/question/domain/entities/questions/responce_entity/question_response_entity.dart';

extension QuestionResponseMapper on QuestionsResponse {
  QuestionResponseEntity responseToEntity() => QuestionResponseEntity(
        message: message,
        questions: questions?.map((question) => question.modelToEntity()).toList(),
      );
}
