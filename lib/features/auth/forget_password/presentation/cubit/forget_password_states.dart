import 'package:exam_app/core/entities/auth_response_entity.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_step.dart';

class ForgetPasswordStates {
  final String? email;
final ForgetPasswordStep step;
  final BaseState<ForgetPasswordEntity> sendEmailState;
  final BaseState<VerifyResetCodeEntity> verifyResetState;
  final BaseState<AuthResponseEntity> resetPasswordState;

  const ForgetPasswordStates({
    this.step = ForgetPasswordStep.email,
    this.email,
    this.sendEmailState = const BaseState(),
    this.verifyResetState = const BaseState(),
    this.resetPasswordState = const BaseState(),
  });

  ForgetPasswordStates copyWith({
    ForgetPasswordStep? step,
    String? email,
    BaseState<ForgetPasswordEntity>? sendEmailState,
    BaseState<VerifyResetCodeEntity>? verifyResetState,
    BaseState<AuthResponseEntity>? resetPasswordState,
  }) {
    return ForgetPasswordStates(
      step: step ?? this.step,
      email: email ?? this.email,
      sendEmailState: sendEmailState ?? this.sendEmailState,
      verifyResetState: verifyResetState ?? this.verifyResetState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }
}
