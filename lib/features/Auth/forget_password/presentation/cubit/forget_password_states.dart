import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/Auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/Auth/forget_password/domain/entities/verify_reset_entity.dart';

class ForgetPasswordStates {
  bool isFormValid;
  BaseState<ForgetPasswordEntity> sendEmailState =
      BaseState<ForgetPasswordEntity>();

  BaseState<VerifyResetEntity> verifyResetState =
      BaseState<VerifyResetEntity>();

  ForgetPasswordStates({
    BaseState<ForgetPasswordEntity>? sendEmailState,
    BaseState<VerifyResetEntity>? verifyResetState,
    this.isFormValid = true,
  }) {
    this.sendEmailState = sendEmailState ?? BaseState<ForgetPasswordEntity>();
    this.verifyResetState = verifyResetState ?? BaseState<VerifyResetEntity>();
  }

  ForgetPasswordStates copyWith({
    BaseState<ForgetPasswordEntity>? sendEmailState,
    BaseState<VerifyResetEntity>? verifyResetState,
    bool? isFormValid,
  }) {
    return ForgetPasswordStates(
      sendEmailState: sendEmailState ?? this.sendEmailState,
      verifyResetState: verifyResetState ?? this.verifyResetState,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
