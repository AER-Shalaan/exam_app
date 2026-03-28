import 'package:exam_app/features/question/data/models/question_model/question_model.dart';

class QuestionResponseEntity {
  final String message;
  final List<QuestionModel> questions;

  QuestionResponseEntity({required this.message, required this.questions});
}
