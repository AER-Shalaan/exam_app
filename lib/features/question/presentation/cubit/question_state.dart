part of 'question_cubit.dart';

class QuestionState {
  BaseState<QuestionResponseEntity> questionState;

  QuestionState({BaseState<QuestionResponseEntity>? questionstate})
      : questionState = questionstate ?? BaseState<QuestionResponseEntity>();

  QuestionState copyWith({BaseState<QuestionResponseEntity>? questionState}) {
    return QuestionState(
      questionstate: questionState ?? this.questionState,
    );
  }
}
