import 'dart:async';

import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/question/data/models/check_questions/request/question_request.dart';
import 'package:exam_app/features/question/data/models/questions/answer_model/answer_model.dart';
import 'package:exam_app/features/question/data/models/questions/exam_model/exam_model.dart';
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
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZWEwNDhhMDRkYTBkNGNmNTU2ZWZhYiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc2OTQ0MjY2fQ.AbUI5hr2bwewxGxHITd77To7ewnHy6wvahqFK0P1Xfk";
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
  Timer? _examTimer;

  void selectAnswer(int questionIndex, CorrectModel answerKey) {
    final questionData = state.questionState.data;
    if (questionData == null ||
        questionIndex >= questionData.questions.length) {
      return;
    }

    final questions = List.of(questionData.questions);
    final question = questions[questionIndex];

    if (question.type == QuestionType.singleChoice) {
      question.selectedAnswerKeys
        ..clear()
        ..add(answerKey);
    } else {
      if (question.selectedAnswerKeys.contains(answerKey)) {
        question.selectedAnswerKeys.remove(answerKey);
      } else {
        question.selectedAnswerKeys.add(answerKey);
      }
    }

    emit(
      state.copyWith(
        questionState: state.questionState.copyWith(
          dataParam: QuestionResponseEntity(
            message: questionData.message,
            questions: questions,
          ),
        ),
      ),
    );
  }

  void previousQuestion() {
    if (state.currentQuestionIndex <= 0) return;
    emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1));
  }

  void nextQuestion() {
    final questionCount = state.questionState.data?.questions.length ?? 0;
    if (state.currentQuestionIndex >= questionCount - 1) return;
    emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1));
  }

  void startExamTimer(int durationInMinutes) {
    _examTimer?.cancel();
    final totalDurationInSeconds = durationInMinutes * 60;

    emit(
      state.copyWith(
        totalDurationInSeconds: totalDurationInSeconds,
        remainingDurationInSeconds: totalDurationInSeconds,
        isExamTimeFinished: false,
      ),
    );

    _examTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingDurationInSeconds <= 1) {
        timer.cancel();
        emit(
          state.copyWith(
            remainingDurationInSeconds: 0,
            isExamTimeFinished: true,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          remainingDurationInSeconds: state.remainingDurationInSeconds - 1,
        ),
      );
    });
  }

  String formattedRemainingTime() {
    final minutes = state.remainingDurationInSeconds ~/ 60;
    final seconds = state.remainingDurationInSeconds % 60;
    final minutesText = minutes.toString().padLeft(2, '0');
    final secondsText = seconds.toString().padLeft(2, '0');
    return '$minutesText:$secondsText';
  }

  bool isTimerInWarningState() {
    if (state.totalDurationInSeconds == 0) return false;
    return state.remainingDurationInSeconds <=
        (state.totalDurationInSeconds ~/ 2);
  }

  void stopExamTimer() {
    _examTimer?.cancel();
    _examTimer = null;
  }

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
        final examDurationInMinutes =
            data.questions.isNotEmpty ? data.questions.first.exam.duration : 0;
        emit(state.copyWith(
            questionState: state.questionState
                .copyWith(isLoadingParam: false, dataParam: data),
            currentQuestionIndex: 0));
        if (examDurationInMinutes > 0) {
          startExamTimer(examDurationInMinutes);
        }
        break;
      case ErrorBaseResponse<QuestionResponseEntity>():
        emit(state.copyWith(
            questionState: state.questionState.copyWith(
                isLoadingParam: false,
                errorMessageParam: response.errorMessage)));
        break;
    }
  }

  @override
  Future<void> close() {
    stopExamTimer();
    return super.close();
  }
}
