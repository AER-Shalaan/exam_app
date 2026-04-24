import 'dart:async';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/question/data/models/check_questions/request/question_request.dart';
import 'package:exam_app/features/question/data/models/questions/question_response.dart';
import 'package:exam_app/features/question/domain/entities/check_questions/check_questions_response/check_question_response_entity.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_entity/questions_model_entity.dart';
import 'package:exam_app/features/question/domain/entities/questions/responce_entity/question_response_entity.dart';
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
  Timer? _examTimer;

  void doQuestionEvent(QuestionEvent event) {
    switch (event) {
      case QuestionsUseCase():
        _getQuestionsOnExam(event.examId ?? '');
        break;

      case CheckQuestionsUseCase():
        _checkQuestions(
          event.questionRequest ?? _buildQuestionRequest(),
        );
        break;
    }
  }


  void selectAnswer(int questionIndex, CorrectModel answerKey) {
    final questionData = state.questionState.data;

    final questions = List<QuestionModelEntity>.from(
      questionData?.questions ?? [],
    );

    if (questionIndex >= questions.length) return;

    final question = questions[questionIndex];

    if (question.type == 'single_choice') {
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
            message: questionData?.message ?? '',
            questions: List<QuestionModelEntity>.from(questions),
          ),
        ),
      ),
    );
  }

  void previousQuestion() {
    if (state.currentQuestionIndex <= 0) return;

    emit(
      state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex - 1,
      ),
    );
  }

  void nextQuestion() {
    final questionCount = state.questionState.data?.questions?.length ?? 0;

    if (state.currentQuestionIndex >= questionCount - 1) return;

    emit(
      state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
      ),
    );
  }

  Future<void> _getQuestionsOnExam(String examId) async {
    emit(
      state.copyWith(
        examId: examId,
        questionState: state.questionState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
        ),
        checkQuestionState: state.checkQuestionState.copyWith(
          errorMessageParam: null,
          dataParam: null,
        ),
      ),
    );

    final response = await _getQuestionsUseCase.callOnExam(examId);

    switch (response) {
      case SuccessBaseResponse<QuestionResponseEntity>():
        final data = response.data;

        final questions = data.questions ?? [];

        final examDurationInMinutes =
            questions.isNotEmpty ? (questions.first.exam.duration ?? 0) : 0;

        emit(
          state.copyWith(
            questionState: state.questionState.copyWith(
              isLoadingParam: false,
              dataParam: data.copyWith(
                questions: List<QuestionModelEntity>.from(questions),
              ),
            ),
            currentQuestionIndex: 0,
          ),
        );

        if (examDurationInMinutes > 0) {
          startExamTimer(examDurationInMinutes);
        }

        break;

      case ErrorBaseResponse<QuestionResponseEntity>():
        emit(
          state.copyWith(
            questionState: state.questionState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> _checkQuestions(QuestionRequest questionRequest) async {
    emit(
      state.copyWith(
        checkQuestionState: state.checkQuestionState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
          dataParam: null,
        ),
      ),
    );

    final response = await _getQuestionsUseCase.checkQuestionCall(
      questionRequest,
    );

    switch (response) {
      case SuccessBaseResponse<CheckQuestionsResponseEntity>():
        emit(
          state.copyWith(
            checkQuestionState: state.checkQuestionState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        break;

      case ErrorBaseResponse<CheckQuestionsResponseEntity>():
        emit(
          state.copyWith(
            checkQuestionState: state.checkQuestionState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  void startExamTimer(int durationInMinutes) {
    _examTimer?.cancel();

    final totalSeconds = durationInMinutes * 60;

    emit(
      state.copyWith(
        totalDurationInSeconds: totalSeconds,
        remainingDurationInSeconds: totalSeconds,
        isExamTimeFinished: false,
      ),
    );

    _examTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final remaining = state.remainingDurationInSeconds;

      if (remaining <= 1) {
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
          remainingDurationInSeconds: remaining - 1,
        ),
      );
    });
  }

  String formattedRemainingTime() {
    final minutes = state.remainingDurationInSeconds ~/ 60;
    final seconds = state.remainingDurationInSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  String formattedElapsedTime() {
    final elapsedSeconds =
        state.totalDurationInSeconds - state.remainingDurationInSeconds;
    final safeElapsedSeconds = elapsedSeconds < 0 ? 0 : elapsedSeconds;
    final minutes = safeElapsedSeconds ~/ 60;
    final seconds = safeElapsedSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  bool isTimerInWarningState() {
    final total = state.totalDurationInSeconds;
    if (total == 0) return false;

    return state.remainingDurationInSeconds <= (total ~/ 2);
  }

  void stopExamTimer() {
    _examTimer?.cancel();
    _examTimer = null;
  }

  @override
  Future<void> close() {
    stopExamTimer();
    return super.close();
  }

  bool isAnswered(int index) {
    final answers =
        state.questionState.data?.questions?[index].selectedAnswerKeys;

    return answers is Set && answers!.isNotEmpty;
  }

  QuestionRequest _buildQuestionRequest() {
    final answers = (state.questionState.data?.questions ?? [])
        .where((question) => question.selectedAnswerKeys.isNotEmpty)
        .map(
          (question) => Answer(
            questionId: question.id,
            correct: question.selectedAnswerKeys.first.name,
          ),
        )
        .toList();

    return QuestionRequest(
      time: formattedElapsedTime(),
      answers: answers,
    );
  }
}
