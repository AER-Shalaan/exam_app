import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';
import 'package:exam_app/features/Auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/Auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/Auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterEmailView extends StatelessWidget {
  EnterEmailView({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final forgetPasswordViewModel = context.read<ForgetPasswordViewModel>();

    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          previous.sendEmailState.errorMessage !=
          current.sendEmailState.errorMessage,
      listener: (context, state) {
        if (state.sendEmailState.errorMessage != null &&
            state.sendEmailState.errorMessage!.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.sendEmailState.errorMessage!)),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.sendEmailState.isLoading !=
              current.sendEmailState.isLoading ||
          previous.isFormValid != current.isFormValid,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text(AppStrings.forgotPasswordTitle, style: TextStyles.bodyMedium18),
                const SizedBox(height: 16),
                Text(
                  AppStrings.forgotPasswordDescription,
                  style: TextStyles.bodyMRegular14grey,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: AppStrings.email,
                    hintText: AppStrings.emailHint,
                  ),
                  validator: (value) =>
                      AppValidation.validateEmail(value, required: true),
                  onChanged: (value) {
                    final isValid =
                        AppValidation.validateEmail(value, required: true) ==
                        null;
                    forgetPasswordViewModel.doEvent(
                      FormValidationChangedEvent(isValid: isValid),
                    );
                  },
                ),
                const SizedBox(height: 48),
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      state.isFormValid &&
                              !state.sendEmailState.isLoading &&
                              emailController.text.isNotEmpty
                          ? AppColors.primary
                          : AppColors.baseBlack30,
                    ),
                  ),
                  onPressed:
                      state.isFormValid &&
                          !state.sendEmailState.isLoading &&
                          emailController.text.isNotEmpty
                      ? () {
                          state.sendEmailState.errorMessage = null;
                          forgetPasswordViewModel.doEvent(
                            SendEmailEvent(email: emailController.text.trim()),
                          );
                        }
                      : null,
                  child: state.sendEmailState.isLoading
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: const CircularProgressIndicator(
                            color: AppColors.whiteColor,
                          ),
                        )
                      : const Text(AppStrings.continueString),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
