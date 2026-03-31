part of 'question_cubit.dart';

class QuestionState {
  BaseState<QuestionResponseEntity> questionState;
  BaseState<CheckQuestionsResponseEntity> checkQuestionState;

  QuestionState({
    BaseState<QuestionResponseEntity>? questionstate,
    BaseState<CheckQuestionsResponseEntity>? checkQuestionState,
  })  : questionState = questionstate ?? BaseState<QuestionResponseEntity>(),
        checkQuestionState =
            checkQuestionState ?? BaseState<CheckQuestionsResponseEntity>();

  QuestionState copyWith({
    BaseState<QuestionResponseEntity>? questionState,
    BaseState<CheckQuestionsResponseEntity>? checkQuestionState,
  }) {
    return QuestionState(
      questionstate: questionState ?? this.questionState,
      checkQuestionState: checkQuestionState ?? this.checkQuestionState,
    );
  }
}
