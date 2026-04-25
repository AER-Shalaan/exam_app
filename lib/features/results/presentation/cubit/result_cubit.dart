import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/usecases/get_exam_attempts_use_case.dart';
import 'package:exam_app/features/results/domain/usecases/save_exam_attempt_use_case.dart';
import 'package:exam_app/features/results/presentation/cubit/result_event.dart';
import 'package:exam_app/features/results/presentation/cubit/result_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResultCubit extends Cubit<ResultState> {
  final SaveExamAttemptUseCase _saveExamAttemptUseCase;
  final GetExamAttemptsUseCase _getExamAttemptsUseCase;

  ResultCubit(
    this._saveExamAttemptUseCase,
    this._getExamAttemptsUseCase,
  ) : super(const ResultState());

  void doEvent(ResultEvent event) {
    switch (event) {
      case LoadResultsEvent():
        _loadResults();
        break;
      case SaveResultEvent():
        _saveResult(event.attempt);
        break;
    }
  }

  Future<void> _loadResults() async {
    emit(
      state.copyWith(
        resultsState: state.resultsState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
        ),
      ),
    );

    try {
      final results = await _getExamAttemptsUseCase.call();
      emit(
        state.copyWith(
          resultsState: state.resultsState.copyWith(
            isLoadingParam: false,
            dataParam: results,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          resultsState: state.resultsState.copyWith(
            isLoadingParam: false,
            errorMessageParam: e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> _saveResult(ExamAttemptEntity attempt) async {
    try {
      await _saveExamAttemptUseCase.call(attempt);
      emit(state.copyWith(isSaved: true));
    } catch (e) {
      emit(
        state.copyWith(
          resultsState: state.resultsState.copyWith(
            errorMessageParam: e.toString(),
          ),
        ),
      );
    }
  }
}