class QuestionsModel {
  final String question;

  bool isSelected = false;
  final String dateTime;

  QuestionsModel({
    required this.question,
    required this.isSelected,
    required this.dateTime,
  });
}
