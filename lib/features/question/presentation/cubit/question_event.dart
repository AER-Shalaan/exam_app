sealed class QuestionEvent {}

class QuestionsUseCase extends QuestionEvent {
  String? examId;
  QuestionsUseCase({
    this.examId,
  });
}

