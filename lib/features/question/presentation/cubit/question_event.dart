sealed class QuestionEvent {}

class QuestionsUseCase extends QuestionEvent {
  String token;
  String examId;
  QuestionsUseCase({required this.token, required this.examId});
}
