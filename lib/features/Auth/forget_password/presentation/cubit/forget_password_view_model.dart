import 'package:exam_app/core/network/api_param.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/Auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/Auth/forget_password/domain/entities/verify_reset_entity.dart';
import 'package:exam_app/features/Auth/forget_password/domain/use_cases/send_email_use_case.dart';
import 'package:exam_app/features/Auth/forget_password/domain/use_cases/verify_otp_use_case.dart';
import 'package:exam_app/features/Auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/Auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  ForgetPasswordViewModel(this._sendEmailUseCase, this._verifyResetUseCase)
    : super(ForgetPasswordStates());

  final SendEmailUseCase _sendEmailUseCase;
  final VerifyOtpUseCase _verifyResetUseCase;
  late String _email;
  final PageController pageController = PageController();

  int _currentPage = 0;

  void _nextPage() {
    if (pageController.hasClients) {
      _currentPage++;
      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void doEvent(ForgetPasswordEvents event) {
    switch (event) {
      case SendEmailEvent():
        _sendEmail(event.email);
        break;
      case VerifyResetCodeEvent():
        _verifyResetCode(event.code);
        break;
      case FormValidationChangedEvent():
        emit(state.copyWith(isFormValid: event.isValid));
        break;
      case ResendCodeEvent():
        _resendCode(_email);
        break;
      case ClearVerifyErrorEvent():
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
      body: {ApiParam.email: email},
    );

    switch (response) {
      case SuccessBaseResponse<ForgetPasswordEntity>():
        this._email = email;
        emit(
          state.copyWith(
            sendEmailState: state.sendEmailState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        _nextPage();
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
      body: {ApiParam.resetCode: code},
    );

    switch (response) {
      case SuccessBaseResponse<VerifyResetEntity>():
        emit(
          state.copyWith(
            verifyResetState: state.verifyResetState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        _nextPage();
        break;

      case ErrorBaseResponse<VerifyResetEntity>():
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

  Future<void> _resendCode(String email) async {
    await _sendEmailUseCase.call(body: {ApiParam.email: email});
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
