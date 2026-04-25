import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:exam_app/features/results/data/models/exam_attempt_model.dart';
import 'package:exam_app/features/results/data/models/question_attempt_model.dart';

@module
abstract class HiveModule {
  @preResolve
  Future<Box<ExamAttemptModel>> examAttemptsBox() async {
    await Hive.initFlutter();
    Hive.registerAdapter(QuestionAttemptModelAdapter());
    Hive.registerAdapter(ExamAttemptModelAdapter());
    return await Hive.openBox<ExamAttemptModel>('exam_history');
  }
}
