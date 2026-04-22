import 'package:flutter/material.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:exam_app/features/auth/forget_password/presentation/widgets/confirm_reset_new_password_field.dart';
import 'package:exam_app/features/auth/forget_password/presentation/widgets/reset_new_password_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ResetPasswordBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final ValueNotifier<bool> isPasswordHidden;
  final TextEditingController confirmPasswordController;
  final ValueNotifier<bool> isConfirmPasswordHidden;
  final ForgetPasswordViewModel viewModel;

  const ResetPasswordBody({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.isPasswordHidden,
    required this.confirmPasswordController,
    required this.isConfirmPasswordHidden,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(AppStrings.resetPassword,
                  style: TextStyles.bodyMedium18),
              const SizedBox(height: 16),
              Text(
                AppStrings.resetPasswordDescription,
                style: TextStyles.bodyMRegular14grey,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              ResetNewPasswordField(
                passwordController: passwordController,
                isPasswordHidden: isPasswordHidden,
              ),

              const SizedBox(height: 24),

              ConfirmResetNewPasswordField(
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                isConfirmPasswordHidden: isConfirmPasswordHidden,
              ),

              const SizedBox(height: 48),

              BlocBuilder<ForgetPasswordViewModel, ForgetPasswordStates>(
                buildWhen: (p, c) =>
                    p.resetPasswordState.isLoading !=
                    c.resetPasswordState.isLoading,
                builder: (context, state) {
                  return FilledButton(
                    onPressed: state.resetPasswordState.isLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              viewModel.doEvent(
                                ResetPasswordEvent(
                                  password:
                                      passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                    child: state.resetPasswordState.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.whiteColor,
                            ),
                          )
                        : const Text(AppStrings.continueString),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}