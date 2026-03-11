import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/Auth/forget_password/domain/entities/forget_password_entity.dart';

class ForgetPasswordStates {
  bool isFormValid;
  BaseState<ForgetPasswordEntity> sendEmailState =
      BaseState<ForgetPasswordEntity>();

  ForgetPasswordStates({
    BaseState<ForgetPasswordEntity>? sendEmailState,
    this.isFormValid = true,
  }) {
    this.sendEmailState = sendEmailState ?? BaseState<ForgetPasswordEntity>();
  }

  ForgetPasswordStates copyWith({
    BaseState<ForgetPasswordEntity>? sendEmailState,
    bool? isFormValid,
  }) {
    return ForgetPasswordStates(
      sendEmailState: sendEmailState ?? this.sendEmailState,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
