import 'package:exam_app/features/question/data/models/check_questions/correct_question/correct_questions_model.dart';
import 'package:exam_app/features/question/domain/entities/check_questions/correct_questions/check_questions_entity.dart';

extension CorrectQuestionMappers on CorrectQuestion {
  CorrectQuestionEntity correctQuestionToEntity() => CorrectQuestionEntity(
        answers: answers,
        qid: qid,
        question: question,
        correctAnswer: correctAnswer,
      );
}
