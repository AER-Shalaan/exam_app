import 'package:hive/hive.dart';
import 'question_attempt_model.dart';

class ExamAttemptModel {
  String? userId;
  String? examId;
  String? examTitle;
  String? subjectName;
  String? duration;
  int? examDuration;
  int? correctCount;
  int? wrongCount;
  int? total;
  List<QuestionAttemptModel> questions;

  ExamAttemptModel({
    this.userId,
    this.examId,
    this.examTitle,
    this.subjectName,
    this.duration,
    this.examDuration,
    this.correctCount,
    this.wrongCount,
    this.total,
    this.questions = const [],
  });
}

class ExamAttemptModelAdapter extends TypeAdapter<ExamAttemptModel> {
  @override
  final int typeId = 0;

  @override
  ExamAttemptModel read(BinaryReader reader) {
    final questionsCount = reader.readInt();
    final questions = List.generate(
      questionsCount,
      (_) => QuestionAttemptModelAdapter().read(reader),
    );
    return ExamAttemptModel(
      userId: reader.readString(),
      examId: reader.readString(),
      examTitle: reader.readString(),
      subjectName: reader.readString(),
      duration: reader.readString(),
      examDuration: reader.readInt(),
      correctCount: reader.readInt(),
      wrongCount: reader.readInt(),
      total: reader.readInt(),
      questions: questions,
    );
  }

  @override
  void write(BinaryWriter writer, ExamAttemptModel obj) {
    writer.writeInt(obj.questions.length);
    for (final q in obj.questions) {
      QuestionAttemptModelAdapter().write(writer, q);
    }
    writer.writeString(obj.userId ?? '');
    writer.writeString(obj.examId ?? '');
    writer.writeString(obj.examTitle ?? '');
    writer.writeString(obj.subjectName ?? '');
    writer.writeString(obj.duration ?? '');
    writer.writeInt(obj.examDuration ?? 0);
    writer.writeInt(obj.correctCount ?? 0);
    writer.writeInt(obj.wrongCount ?? 0);
    writer.writeInt(obj.total ?? 0);
  }
}
