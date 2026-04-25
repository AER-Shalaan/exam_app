import 'package:hive/hive.dart';

class QuestionAttemptModel {
  String? questionId;
  String? question;
  String? selectedAnswer;
  String? correctAnswer;
  List<String> answers;

  QuestionAttemptModel({
    this.questionId,
    this.question,
    this.selectedAnswer,
    this.correctAnswer,
    this.answers = const [],
  });
}

class QuestionAttemptModelAdapter extends TypeAdapter<QuestionAttemptModel> {
  @override
  final int typeId = 1;

  @override
  QuestionAttemptModel read(BinaryReader reader) {
    return QuestionAttemptModel(
      questionId: reader.readString(),
      question: reader.readString(),
      selectedAnswer: reader.readString(),
      correctAnswer: reader.readString(),
      answers: reader.readStringList(),
    );
  }

  @override
  void write(BinaryWriter writer, QuestionAttemptModel obj) {
    writer.writeString(obj.questionId ?? '');
    writer.writeString(obj.question ?? '');
    writer.writeString(obj.selectedAnswer ?? '');
    writer.writeString(obj.correctAnswer ?? '');
    writer.writeStringList(obj.answers);
  }
}