import 'package:exam_app/features/exams/domain/entities/exam_entity.dart';

abstract class ExamsStates {}

class ExamsInitialState extends ExamsStates {}

class ExamsLoadingState extends ExamsStates {}

class ExamsSuccessState extends ExamsStates {
  final ExamResponseEntity response;

  ExamsSuccessState({required this.response});
}

class ExamsErrorState extends ExamsStates {
  final String errorMessage;

  ExamsErrorState({required this.errorMessage});
}
