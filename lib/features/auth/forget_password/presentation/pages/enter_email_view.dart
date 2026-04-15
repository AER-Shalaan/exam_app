import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterEmailView extends StatefulWidget {
  const EnterEmailView({super.key});

  @override
  State<EnterEmailView> createState() => _EnterEmailViewState();
}

class _EnterEmailViewState extends State<EnterEmailView> {
  late final TextEditingController emailController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();

    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
      /// 🔥 هنا الإصلاح الحقيقي
      listenWhen: (previous, current) =>
          previous.sendEmailState.isLoading &&
          !current.sendEmailState.isLoading,

      listener: (context, state) {
        final error = state.sendEmailState.errorMessage;
        final success = state.sendEmailState.data;

        /// ❌ في حالة error
        if (error != null && error.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error)));
        }

        /// ✅ في حالة success
        if (success != null) {
          viewModel.doEvent(NextPageEvent());
        }
      },

      buildWhen: (previous, current) =>
          previous.sendEmailState.isLoading != current.sendEmailState.isLoading,

      builder: (context, state) {
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

                  FilledButton(
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
