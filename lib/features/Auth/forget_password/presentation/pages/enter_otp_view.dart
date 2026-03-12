import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/Auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/Auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/Auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class EnterOtpView extends StatelessWidget {
  EnterOtpView({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyles.bodyMedium18,
      decoration: BoxDecoration(
        color: AppColors.primary10,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary, width: 2),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      color: AppColors.whiteColor,
      border: Border.all(color: AppColors.errorColor, width: 2),
    );

    return BlocBuilder<ForgetPasswordViewModel, ForgetPasswordStates>(
      buildWhen: (previous, current) =>
          previous.verifyResetState != current.verifyResetState,
      builder: (context, state) {
        final bool showError =
            state.verifyResetState.errorMessage != null &&
            otpController.text.length == 6;

        return Padding(
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
              Pinput(
                controller: otpController,
                length: 6,
                showCursor: true,
                autofocus: true,
                keyboardType: TextInputType.number,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                errorPinTheme: errorPinTheme,
                errorTextStyle: TextStyles.errorTextFieldStyle,
                forceErrorState: showError,
                onCompleted: (value) {
                  viewModel.doEvent(VerifyResetCodeEvent(code: value.trim()));
                },
                onChanged: (value) {
                  if (state.verifyResetState.errorMessage != null) {
                    viewModel.doEvent(ClearVerifyErrorEvent());
                  }
                },
                errorText: showError
                    ? state.verifyResetState.errorMessage
                    : null,
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
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          viewModel.doEvent(ResendCodeEvent());
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
