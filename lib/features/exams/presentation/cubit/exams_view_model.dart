import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/exams/domain/usecases/get_exams_usecase.dart';
import 'package:exam_app/features/exams/presentation/cubit/exams_events.dart';
import 'package:exam_app/features/exams/presentation/cubit/exams_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamsViewModel extends Bloc<ExamsEvents, ExamsStates> {
  final GetExamsUseCase _getExamsUseCase;

  ExamsViewModel(this._getExamsUseCase) : super(ExamsInitialState()) {
    on<GetExamsEvent>((event, emit) async {
      emit(ExamsLoadingState());
      final result = await _getExamsUseCase.call(subjectId: event.subjectId);
      
      switch (result) {
        case SuccessBaseResponse():
          emit(ExamsSuccessState(response: result.data));
          break;
        case ErrorBaseResponse():
          emit(ExamsErrorState(errorMessage: result.errorMessage));
          break;
      }
    });
  }
}
