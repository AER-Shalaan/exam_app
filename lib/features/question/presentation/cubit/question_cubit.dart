import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';
import 'package:exam_app/features/question/domain/usecases/get_questions_use_case.dart';
import 'package:exam_app/features/question/presentation/cubit/question_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit({required GetQuestionsUseCase getQuestionsUseCase})
      : _getQuestionsUseCase = getQuestionsUseCase,
        super(QuestionState());
  final GetQuestionsUseCase _getQuestionsUseCase;
  void doQuestionEvent(QuestionEvent event, String token, String examId) {
    switch (event) {
      case QuestionsUseCase():
        _getQuestionsOnExam(token, examId);
        break;
    }
  }

  Future<void> _getQuestionsOnExam(String token, String examId) async {
    emit(state.copyWith(
        questionState: state.questionState.copyWith(isLoadingParam: true)));

    final response = await _getQuestionsUseCase.callOnExam(token, examId);

    switch (response) {
      case SuccessBaseResponse<QuestionModelEntity>():
        emit(state.copyWith(
            questionState: state.questionState
                .copyWith(isLoadingParam: false, dataParam: response.data)));
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
