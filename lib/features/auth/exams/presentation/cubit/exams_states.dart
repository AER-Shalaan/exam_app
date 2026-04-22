import 'package:equatable/equatable.dart';
import 'package:exam_app/features/auth/exams/domain/entities/exam_entity.dart';

sealed class ExamsStates extends Equatable {
  const ExamsStates();

  @override
  List<Object?> get props => [];
}

class ExamsInitialState extends ExamsStates {}

class ExamsLoadingState extends ExamsStates {}

class ExamsSuccessState extends ExamsStates {
  final ExamResponseEntity response;

  const ExamsSuccessState({required this.response});

  @override
  List<Object?> get props => [response];
}

class ExamsErrorState extends ExamsStates {
  final String errorMessage;

  const ExamsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
