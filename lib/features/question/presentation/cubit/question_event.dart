import 'package:exam_app/features/question/data/models/check_questions/request/question_request.dart';

sealed class QuestionEvent {}

class QuestionsUseCase extends QuestionEvent {
  final String? examId;
  QuestionsUseCase({
    this.examId,
  });
}

class CheckQuestionsUseCase extends QuestionEvent {
  final QuestionRequest? questionRequest;

  CheckQuestionsUseCase({
    this.questionRequest,
  });
}
