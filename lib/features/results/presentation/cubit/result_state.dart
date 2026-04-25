import 'package:equatable/equatable.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';

class ResultState extends Equatable {
  final BaseState<List<ExamAttemptEntity>> resultsState;
  final bool isSaved;

  const ResultState({
    BaseState<List<ExamAttemptEntity>>? resultsState,
    this.isSaved = false,
  }) : resultsState = resultsState ?? const BaseState();

  ResultState copyWith({
    BaseState<List<ExamAttemptEntity>>? resultsState,
    bool? isSaved,
  }) {
    return ResultState(
      resultsState: resultsState ?? this.resultsState,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  List<Object?> get props => [resultsState, isSaved];
}