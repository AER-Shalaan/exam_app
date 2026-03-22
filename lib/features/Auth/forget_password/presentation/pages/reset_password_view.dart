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

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});

  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final ValueNotifier<bool> isPasswordHidden = ValueNotifier(true);
  final ValueNotifier<bool> isConfirmPasswordHidden = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();

    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          previous.resetPasswordState != current.resetPasswordState,
      listener: (context, state) {
        if (state.resetPasswordState.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.resetPasswordState.errorMessage!)),
          );
        }
        if (state.resetPasswordState.data != null) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              title: const Text(AppStrings.passwordChanged),
              content: const Text(AppStrings.passwordChangedDescription),
              actions: [
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   AppRoutes.loginViewRouteName,
                    //   (route) => false,
                    // );
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
              autovalidateMode: AutovalidateMode.disabled,
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
                  ValueListenableBuilder(
                    valueListenable: isPasswordHidden,
                    builder: (BuildContext context, hidden, _) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: hidden,
                        decoration: InputDecoration(
                          labelText: AppStrings.newPassword,
                          hintText: AppStrings.passwordHint,
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              hidden
                                  ? Assets.assetsIconsVisibilityOff
                                  : Assets.assetsIconsVisibility,
                              height: 22,
                            ),
                            onPressed: () {
                              isPasswordHidden.value = !hidden;
                            },
                          ),
                        ),
                        validator: (value) {
                          return AppValidation.validatePassword(value);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  ValueListenableBuilder(
                    valueListenable: isConfirmPasswordHidden,
                    builder: (BuildContext context, hidden, _) {
                      return TextFormField(
                        controller: confirmPasswordController,
                        obscureText: hidden,
                        decoration: InputDecoration(
                          labelText: AppStrings.confirmPassword,
                          hintText: AppStrings.confirmPassword,
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              hidden
                                  ? Assets.assetsIconsVisibilityOff
                                  : Assets.assetsIconsVisibility,
                              height: 22,
                            ),
                            onPressed: () {
                              isConfirmPasswordHidden.value = !hidden;
                            },
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
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
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
