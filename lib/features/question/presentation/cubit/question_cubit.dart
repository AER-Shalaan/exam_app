import 'package:exam_app/core/auth/token_manager.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/question/domain/entities/responce/question_response_entity.dart';
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
        _getQuestionsOnExam(event.token ?? '', event.examId ?? '');
        break;
    }
  }

  Future<void> _getQuestionsOnExam(String token, String examId) async {
    emit(state.copyWith(
        questionState: state.questionState.copyWith(isLoadingParam: true)));
//todo============================================
    final response = await _getQuestionsUseCase.callOnExam(
        TokenManager.token ?? "", examId
        //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5YzMxYTc4Y2ViMmM1OWY4NGEzZTgxNCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc0MzkzOTc2fQ.MDrScrZMqTJRUaWkB99hiQJQ94PCmhetTstWeRKI6bo",
        // "670070a830a3c3c1944a9c63"
//todo============================================

        );
    switch (response) {
      case SuccessBaseResponse<QuestionResponseEntity>():
        final data = response.data;
        emit(state.copyWith(
            questionState: state.questionState
                .copyWith(isLoadingParam: false, dataParam: data)));
        break;
      case ErrorBaseResponse<QuestionResponseEntity>():
        emit(state.copyWith(
            questionState: state.questionState.copyWith(
                isLoadingParam: false,
                errorMessageParam: response.errorMessage)));
        break;
    }
  }
}
