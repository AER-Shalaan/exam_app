import 'package:exam_app/core/entities/auth_response_entity.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';

class ForgetPasswordStates {
  final bool isFormValid;
  final String? email;
  final int currentPage;

  final BaseState<ForgetPasswordEntity> sendEmailState;
  final BaseState<VerifyResetCodeEntity> verifyResetState;
  final BaseState<AuthResponseEntity> resetPasswordState;

  const ForgetPasswordStates({
    this.currentPage = 0,
    this.isFormValid = true,
    this.email,
    this.sendEmailState = const BaseState(),
    this.verifyResetState = const BaseState(),
    this.resetPasswordState = const BaseState(),
  });

  ForgetPasswordStates copyWith({
    int? currentPage,
    bool? isFormValid,
    String? email,
    BaseState<ForgetPasswordEntity>? sendEmailState,
    BaseState<VerifyResetCodeEntity>? verifyResetState,
    BaseState<AuthResponseEntity>? resetPasswordState,
  }) {
    return ForgetPasswordStates(
      currentPage: currentPage ?? this.currentPage,
      isFormValid: isFormValid ?? this.isFormValid,
      email: email ?? this.email,
      sendEmailState: sendEmailState ?? this.sendEmailState,
      verifyResetState: verifyResetState ?? this.verifyResetState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }
}
