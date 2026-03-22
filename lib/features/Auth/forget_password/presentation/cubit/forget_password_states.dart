import 'package:exam_app/core/entities/auth_response_entity.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_entity.dart';

class ForgetPasswordStates {
  bool isFormValid;
  BaseState<ForgetPasswordEntity> sendEmailState =
      BaseState<ForgetPasswordEntity>();

  BaseState<VerifyResetEntity> verifyResetState =
      BaseState<VerifyResetEntity>();

  BaseState<AuthResponseEntity> resetPasswordState =
      BaseState<AuthResponseEntity>();

  ForgetPasswordStates({
    BaseState<ForgetPasswordEntity>? sendEmailState,
    BaseState<VerifyResetEntity>? verifyResetState,
    BaseState<AuthResponseEntity>? resetPasswordState,
    this.isFormValid = true,
  }) {
    this.sendEmailState = sendEmailState ?? BaseState<ForgetPasswordEntity>();
    this.verifyResetState = verifyResetState ?? BaseState<VerifyResetEntity>();
    this.resetPasswordState =
        resetPasswordState ?? BaseState<AuthResponseEntity>();
  }

  ForgetPasswordStates copyWith({
    BaseState<ForgetPasswordEntity>? sendEmailState,
    BaseState<VerifyResetEntity>? verifyResetState,
    BaseState<AuthResponseEntity>? resetPasswordState,
    bool? isFormValid,
  }) {
    return ForgetPasswordStates(
      sendEmailState: sendEmailState ?? this.sendEmailState,
      verifyResetState: verifyResetState ?? this.verifyResetState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
