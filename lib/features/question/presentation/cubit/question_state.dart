part of 'question_cubit.dart';

class QuestionState {
  BaseState<QuestionModelEntity> questionState;

  QuestionState({BaseState<QuestionModelEntity>? questionstate})
      : questionState = questionstate ?? BaseState<QuestionModelEntity>();

  QuestionState copyWith({BaseState<QuestionModelEntity>? questionState}) {
    return QuestionState(

    );
  }
}
