import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  late final ValueNotifier<bool> isPasswordHidden;
  late final ValueNotifier<bool> isConfirmPasswordHidden;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    isPasswordHidden = ValueNotifier(true);
    isConfirmPasswordHidden = ValueNotifier(true);
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    isPasswordHidden.dispose();
    isConfirmPasswordHidden.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();

    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          previous.resetPasswordState != current.resetPasswordState,
      listener: (context, state) {
        final error = state.resetPasswordState.errorMessage;
        final success = state.resetPasswordState.data;

        if (error != null && error.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error)));
        }

        if (success != null) {
          if (!mounted) return;
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              title: const Text(AppStrings.passwordChanged),
              content: const Text(AppStrings.passwordChangedDescription),
              actions: [
                TextButton(
                  onPressed: () {
                    
                  },
                  child: const Text(AppStrings.login),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  Text(
                    AppStrings.resetPassword,
                    style: TextStyles.bodyMedium18,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    AppStrings.resetPasswordDescription,
                    style: TextStyles.bodyMRegular14grey,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  ValueListenableBuilder<bool>(
                    valueListenable: isPasswordHidden,
                    builder: (_, hidden, _) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: hidden,
                        decoration: InputDecoration(
                          labelText: AppStrings.newPassword,
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              hidden
                                  ? Assets.assetsIconsVisibilityOff
                                  : Assets.assetsIconsVisibility,
                            ),
                            onPressed: () => isPasswordHidden.value = !hidden,
                          ),
                        ),
                        validator: AppValidation.validatePassword,
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  ValueListenableBuilder<bool>(
                    valueListenable: isConfirmPasswordHidden,
                    builder: (_, hidden, _) {
                      return TextFormField(
                        controller: confirmPasswordController,
                        obscureText: hidden,
                        decoration: InputDecoration(
                          labelText: AppStrings.confirmPassword,
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              hidden
                                  ? Assets.assetsIconsVisibilityOff
                                  : Assets.assetsIconsVisibility,
                            ),
                            onPressed: () =>
                                isConfirmPasswordHidden.value = !hidden,
                          ),
                        ),
                        validator: (value) {
                          return AppValidation.validatePasswordConfirmation(
                            passwordController.text,
                            value,
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 48),

                  FilledButton(
                    onPressed: state.resetPasswordState.isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              viewModel.doEvent(
                                ResetPasswordEvent(
                                  password: passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                    child: state.resetPasswordState.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
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
