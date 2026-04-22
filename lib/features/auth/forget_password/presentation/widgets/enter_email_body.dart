import 'package:flutter/material.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterEmailBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final ForgetPasswordViewModel viewModel;

  const EnterEmailBody({
    super.key,
    required this.formKey,
    required this.emailController,
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
              Text(
                AppStrings.forgotPasswordTitle,
                style: TextStyles.bodyMedium18,
              ),
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
              ),

              const SizedBox(height: 48),

              BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
                listenWhen: (previous, current) =>
                    previous.sendEmailState != current.sendEmailState,
                listener: (context, state) {
                  if (state.sendEmailState.errorMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.sendEmailState.errorMessage!),
                        backgroundColor: AppColors.errorColor,
                      ),
                    );
                  }
                },
                buildWhen: (pervious, current) =>
                    pervious.sendEmailState.isLoading !=
                    current.sendEmailState.isLoading,
                builder: (context, state) {
                  return FilledButton(
                    onPressed: state.sendEmailState.isLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              viewModel.doEvent(
                                SendEmailEvent(
                                  email: emailController.text.trim(),
                                ),
                              );
                            }
                          },
                    child: state.sendEmailState.isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
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
