import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entity.dart';

class SignUpStates {
  bool isFormValid;
  BaseState<SignUpEntity> signUpState;

  SignUpStates({BaseState<SignUpEntity>? signUpState, this.isFormValid = true})
    : signUpState = signUpState ?? BaseState<SignUpEntity>();

  SignUpStates copyWith({
    bool? isFormValid,
    BaseState<SignUpEntity>? signUpState,
  }) {
    return SignUpStates(
      isFormValid: isFormValid ?? this.isFormValid,
      signUpState: signUpState ?? this.signUpState,
    );
  }
}
