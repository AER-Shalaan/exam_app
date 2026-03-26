import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entity.dart';

class SignUpStates {
  BaseState<SignUpEntity> signUpState;

  SignUpStates({BaseState<SignUpEntity>? signUpState})
    : signUpState = signUpState ?? BaseState<SignUpEntity>();

  SignUpStates copyWith({
    BaseState<SignUpEntity>? signUpState
  }) {
    return SignUpStates(
      signUpState: signUpState ?? this.signUpState);
  }
}
