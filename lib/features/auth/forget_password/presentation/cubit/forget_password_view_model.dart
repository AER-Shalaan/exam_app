import 'package:exam_app/core/entities/auth_response_entity.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/forget_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/reset_password_request_model.dart';
import 'package:exam_app/features/auth/forget_password/api/request_models/verify_reset_code_request_model.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code_entity.dart';
import 'package:exam_app/features/auth/forget_password/domain/use_cases/reset_password_use_case.dart';
import 'package:exam_app/features/auth/forget_password/domain/use_cases/send_email_use_case.dart';
import 'package:exam_app/features/auth/forget_password/domain/use_cases/verify_otp_use_case.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_step.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  ForgetPasswordViewModel(
    this._sendEmailUseCase,
    this._verifyResetUseCase,
    this._resetPasswordUseCase,
  ) : super(ForgetPasswordStates());

  final SendEmailUseCase _sendEmailUseCase;
  final VerifyOtpUseCase _verifyResetUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  void doEvent(ForgetPasswordEvents event) {
    switch (event) {
      case SendEmailEvent():
        _sendEmail(event.email);
        break;
      case VerifyResetCodeEvent():
        _verifyResetCode(event.code);
        break;
      case ResendCodeEvent():
        _handleResend();
        break;
      case ResetPasswordEvent():
        _resetPassword(event.password);
        break;
      case NextPageEvent():
        _nextStep();
        break;
      case ClearVerifyCodeErrorEvent():
        emit(
          state.copyWith(
            verifyResetState: state.verifyResetState.copyWith(
              errorMessageParam: null,
            ),
          ),
        );
        break;
    }
  }

  void _nextStep() {
    switch (state.step) {
      case ForgetPasswordStep.email:
        emit(state.copyWith(step: ForgetPasswordStep.verifyCode));
        break;

      case ForgetPasswordStep.verifyCode:
        emit(state.copyWith(step: ForgetPasswordStep.resetPassword));
        break;

      case ForgetPasswordStep.resetPassword:
        break;
    }
  }

  Future<void> _sendEmail(String email) async {
    emit(
      state.copyWith(
        sendEmailState: state.sendEmailState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
          dataParam: null,
        ),
      ),
    );

    final response = await _sendEmailUseCase.call(
      body: ForgetPasswordRequestModel(email: email),
    );

    switch (response) {
      case SuccessBaseResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            sendEmailState: state.sendEmailState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
            email: email,
          ),
        );

        break;

      case ErrorBaseResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            sendEmailState: state.sendEmailState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> _verifyResetCode(String code) async {
    emit(
      state.copyWith(
        verifyResetState: state.verifyResetState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
          dataParam: null,
        ),
      ),
    );

    final response = await _verifyResetUseCase.call(
      body: VerifyResetCodeRequestModel(resetCode: code),
    );

    switch (response) {
      case SuccessBaseResponse<VerifyResetCodeEntity>():
        emit(
          state.copyWith(
            verifyResetState: state.verifyResetState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        break;

      case ErrorBaseResponse<VerifyResetCodeEntity>():
        emit(
          state.copyWith(
            verifyResetState: state.verifyResetState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> _handleResend() async {
    final email = state.email;

    if (email == null || email.isEmpty) {
      emit(
        state.copyWith(
          verifyResetState: state.verifyResetState.copyWith(
            errorMessageParam: "Email not found. Restart flow.",
          ),
        ),
      );
      return;
    }
    await _resendCode(email);
  }

  Future<void> _resendCode(String email) async {
    await _sendEmailUseCase.call(
      body: ForgetPasswordRequestModel(email: email),
    );
  }

  Future<void> _resetPassword(String password) async {
    emit(
      state.copyWith(
        resetPasswordState: state.resetPasswordState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
          dataParam: null,
        ),
      ),
    );

    final response = await _resetPasswordUseCase.call(
      body: ResetPasswordRequestModel(
        email: state.email!,
        newPassword: password,
      ),
    );

    switch (response) {
      case SuccessBaseResponse<AuthResponseEntity>():
        emit(
          state.copyWith(
            resetPasswordState: state.resetPasswordState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        break;

      case ErrorBaseResponse<AuthResponseEntity>():
        emit(
          state.copyWith(
            resetPasswordState: state.resetPasswordState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }
}
