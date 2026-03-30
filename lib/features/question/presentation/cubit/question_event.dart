sealed class QuestionEvent {}

class QuestionsUseCase extends QuestionEvent {
  String? token;
  String? examId;
  QuestionsUseCase({
    this.token,
    this.examId,
  });
}
