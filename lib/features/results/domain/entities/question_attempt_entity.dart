class QuestionAttemptEntity {
  String? questionId;
  String? question;
  String? selectedAnswer;
  String? correctAnswer;
  List<String>? answers;

  QuestionAttemptEntity({
    this.questionId,
    this.question,
    this.selectedAnswer,
    this.correctAnswer,
    this.answers,
  });
}