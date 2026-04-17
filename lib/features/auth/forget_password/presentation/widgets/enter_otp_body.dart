import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:exam_app/features/auth/forget_password/presentation/widgets/otp_input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget enterOtpBody 
   ({
    required TextEditingController otpController,
    required ForgetPasswordViewModel viewModel,
     required ForgetPasswordStates state,
    required TapGestureRecognizer resendRecognizer,
  }){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              AppStrings.verifyCodeTitle,
              style: TextStyles.bodyMedium18,
            ),
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
                viewModel.doEvent(VerifyResetCodeEvent(code: value.trim()));
              },
              onChanged: (value) {
                if (state.verifyResetState.errorMessage != null) {
                  viewModel.doEvent(
                    ClearVerifyCodeErrorEvent(),
                  );
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
                    text: AppStrings.resend,
                    style: TextStyles.bodyMedium16PrimaryUnderline,
                    recognizer: resendRecognizer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

