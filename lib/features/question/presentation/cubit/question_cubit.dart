import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/question/data/models/check_questions/request/question_request.dart';
import 'package:exam_app/features/question/domain/entities/check_questions/check_questions_response/check_question_response_entity.dart';
import 'package:exam_app/features/question/domain/entities/questions/responce_entity/question_response_entity.dart';
import 'package:exam_app/features/question/domain/usecases/get_questions_use_case.dart';
import 'package:exam_app/features/question/presentation/cubit/question_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'question_state.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  final tokenKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5YzMxYTc4Y2ViMmM1OWY4NGEzZTgxNCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc0MzkzOTc2fQ.MDrScrZMqTJRUaWkB99hiQJQ94PCmhetTstWeRKI6bo";
  void doQuestionEvent(QuestionEvent event) {
    switch (event) {
      case QuestionsUseCase():
        _getQuestionsOnExam(event.examId ?? '');
        break;
        case CheckQuestionsUseCase():
        _checkQuestion(event.questionRequest ?? QuestionRequest());
        break;
    }
  }

  QuestionCubit({required GetQuestionsUseCase getQuestionsUseCase})
      : _getQuestionsUseCase = getQuestionsUseCase,
        super(QuestionState());
  final GetQuestionsUseCase _getQuestionsUseCase;
  Future<void> _checkQuestion(QuestionRequest questionRequest) async {
    emit(state.copyWith(
        checkQuestionState:
            state.checkQuestionState.copyWith(isLoadingParam: true)));

    final response =
        await _getQuestionsUseCase.checkQuestionCall(tokenKey, questionRequest);
    switch (response) {
      case SuccessBaseResponse<CheckQuestionsResponseEntity>():
        final data = response.data;
        emit(state.copyWith(
            checkQuestionState: state.checkQuestionState
                .copyWith(isLoadingParam: false, dataParam: data)));
        break;
      case ErrorBaseResponse<CheckQuestionsResponseEntity>():
        emit(state.copyWith(
            checkQuestionState: state.checkQuestionState.copyWith(
                isLoadingParam: false,
                errorMessageParam: response.errorMessage)));
        break;
    }
  }
  Future<void> _getQuestionsOnExam(String examId) async {
    emit(state.copyWith(
        questionState: state.questionState.copyWith(isLoadingParam: true)));

    final response = await _getQuestionsUseCase.callOnExam(tokenKey, examId);
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
