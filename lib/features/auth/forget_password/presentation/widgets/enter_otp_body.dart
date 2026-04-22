import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:exam_app/features/auth/forget_password/presentation/widgets/otp_input_field.dart';

class EnterOtpBody extends StatelessWidget {
  final TextEditingController otpController;
  final ForgetPasswordViewModel viewModel;
  final ForgetPasswordStates state;
  final TapGestureRecognizer resendRecognizer;

  const EnterOtpBody({
    super.key,
    required this.otpController,
    required this.viewModel,
    required this.state,
    required this.resendRecognizer,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(AppStrings.verifyCodeTitle, style: TextStyles.bodyMedium18),
            const SizedBox(height: 16),
            Text(
              AppStrings.verifyCodeDescription,
              style: TextStyles.bodyMRegular14grey,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            otpInputField(
              controller: otpController,
              showError:
                  state.verifyResetState.errorMessage != null &&
                  otpController.text.length == 6,
              errorMessage: state.verifyResetState.errorMessage,
              onCompleted: (value) {
                viewModel.doEvent(
                  VerifyResetCodeEvent(code: value.trim()),
                );
              },
              onChanged: (value) {
                if (state.verifyResetState.errorMessage != null) {
                  viewModel.doEvent(ClearVerifyCodeErrorEvent());
                }
              },
            ),
            const SizedBox(height: 24),
            Text.rich(
              TextSpan(
                text: AppStrings.resendCodeString,
                style: TextStyles.bodyRegular16,
                children: [
                  TextSpan(
                    text: state.resendCodeState.isLoading
                        ? AppStrings.resending
                        : state.resendSecondsLeft > 0
                            ? AppStrings.resendIn(state.resendSecondsLeft)
                            : AppStrings.resend,
                    style: TextStyles.bodyMedium16PrimaryUnderline,
                    recognizer:
                        (state.resendSecondsLeft == 0 &&
                                !state.resendCodeState.isLoading)
                            ? resendRecognizer
                            : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}