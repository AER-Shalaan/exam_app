import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';
import 'package:exam_app/features/question/domain/usecases/get_questions_use_case.dart';
import 'package:exam_app/features/question/presentation/cubit/question_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'question_state.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit({required GetQuestionsUseCase getQuestionsUseCase})
      : _getQuestionsUseCase = getQuestionsUseCase,
        super(QuestionState());
  final GetQuestionsUseCase _getQuestionsUseCase;
  void doQuestionEvent(QuestionEvent event) {
    switch (event) {
      case QuestionsUseCase():
        _getQuestionsOnExam(event.questionModelEntity.id, event.token ?? '');
        break;
    }
  }

  Future<void> _getQuestionsOnExam(String token, String examId) async {
    emit(state.copyWith(
        questionState: state.questionState.copyWith(isLoadingParam: true)));

    final response = await _getQuestionsUseCase.callOnExam(token, examId);

    switch (response) {
      case SuccessBaseResponse<QuestionModelEntity>():
        final data = response.data;
        emit(state.copyWith(
            questionState: state.questionState
                .copyWith(isLoadingParam: false, dataParam: data)));
        break;
      case ErrorBaseResponse<QuestionModelEntity>():
        emit(state.copyWith(
            questionState: state.questionState.copyWith(
                isLoadingParam: false,
                errorMessageParam: response.errorMessage)));
        break;
    }
  }
}
