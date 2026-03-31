class QuestionRequest {
  String? time;
  List<Answer>? answers;

  QuestionRequest({
    this.time,
    this.answers,
  });

  Map<String, dynamic> toJson() => {
        'time': time,
        'answers': answers?.map((answer) => answer.toJson()).toList(),
      };
}

class Answer {
  String? questionId;
  String? correct;

  Answer({
    this.questionId,
    this.correct,
  });

  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'correct': correct,
      };
}
