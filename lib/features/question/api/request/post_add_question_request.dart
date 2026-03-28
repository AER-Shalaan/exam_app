class postAddQuestionRequest {
  String question;
  String A1;
  String A2;
  String A3;
  String A4;
  String correct;
  String subject;
  String exam;

  postAddQuestionRequest({
    required this.question,
    required this.A1,
    required this.A2,
    required this.A3,
    required this.A4,
    required this.correct,
    required this.subject,
    required this.exam,
  });

  Map<String, dynamic> toJson() => {
    "question": question,
    "A1": A1,
    "A2": A2,
    "A3": A3,
    "A4": A4,
    "correct": correct,
    "subject": subject,
    "exam": exam,
  };
}
    // "question":"How can you open a link in a new tab/browser window?",
    // "A1":" <a href='url' new>",
    // "A2":" <a href='url' target='new'>",
    // "A3":" <a href='url' target='_blank'>",
    // "A4":"~",
    // "correct":"A3",
    // "subject": "670037f6728c92b7fdf434fc",
    // "exam":"670070a830a3c3c1944a9c63"
