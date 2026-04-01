part of 'question_cubit.dart';

class QuestionState {
  BaseState<QuestionResponseEntity> questionState;
  BaseState<CheckQuestionsResponseEntity> checkQuestionState;
  int currentQuestionIndex;
  int totalDurationInSeconds;
  int remainingDurationInSeconds;
  bool isExamTimeFinished;

  QuestionState({
    BaseState<QuestionResponseEntity>? questionstate,
    BaseState<CheckQuestionsResponseEntity>? checkQuestionState,
    int? currentQuestionIndex,
    int? totalDurationInSeconds,
    int? remainingDurationInSeconds,
    bool? isExamTimeFinished,
  })  : questionState = questionstate ?? BaseState<QuestionResponseEntity>(),
        checkQuestionState =
            checkQuestionState ?? BaseState<CheckQuestionsResponseEntity>(),
        currentQuestionIndex = currentQuestionIndex ?? 0,
        totalDurationInSeconds = totalDurationInSeconds ?? 0,
        remainingDurationInSeconds = remainingDurationInSeconds ?? 0,
        isExamTimeFinished = isExamTimeFinished ?? false;

  QuestionState copyWith({
    BaseState<QuestionResponseEntity>? questionState,
    BaseState<CheckQuestionsResponseEntity>? checkQuestionState,
    int? currentQuestionIndex,
    int? totalDurationInSeconds,
    int? remainingDurationInSeconds,
    bool? isExamTimeFinished,
  }) {
    return QuestionState(
      questionstate: questionState ?? this.questionState,
      checkQuestionState: checkQuestionState ?? this.checkQuestionState,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      totalDurationInSeconds:
          totalDurationInSeconds ?? this.totalDurationInSeconds,
      remainingDurationInSeconds:
          remainingDurationInSeconds ?? this.remainingDurationInSeconds,
      isExamTimeFinished: isExamTimeFinished ?? this.isExamTimeFinished,
    );
  }
}
