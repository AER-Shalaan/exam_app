import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';
import 'package:exam_app/features/auth/sign_up/apis/sign_up_request/sign_up_request.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_events.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_states.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(AppStrings.signUpTitle),
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<SignUpCubit>(),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  TextFormField(
                    controller: userNameController,
                    validator: (value) => AppValidation.validateRequired(value),
                    decoration: InputDecoration(
                      hintText: AppStrings.usernameHint,
                      label: Text(AppStrings.userName),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: firstNameController,
                          validator: (value) =>
                              AppValidation.validateRequired(value),
                          decoration: InputDecoration(
                            hintText: AppStrings.firstnameHint,
                            label: Text(AppStrings.firstName),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: lastNameController,
                          validator: (value) =>
                              AppValidation.validateRequired(value),
                          decoration: InputDecoration(
                            hintText: AppStrings.lastnameHint,
                            label: Text(AppStrings.lastName),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  TextFormField(
                    controller: emailController,
                    validator: (value) => AppValidation.validateEmail(value),
                    decoration: InputDecoration(
                      hintText: AppStrings.emailHint,
                      label: Text(AppStrings.email),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) =>
                              AppValidation.validatePassword(value),
                          decoration: InputDecoration(
                            hintText: AppStrings.passwordHint,
                            label: Text(AppStrings.password),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: confirmPasswordController,
                          validator: (value) =>
                              AppValidation.validatePasswordConfirmation(
                                passwordController.text,
                                value,
                              ),
                          decoration: InputDecoration(
                            hintText: AppStrings.confirmPassword,
                            label: Text(AppStrings.confirmPassword),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  TextFormField(
                    controller: phoneNumberController,
                    validator: (value) => AppValidation.validatePhone(value),
                    decoration: InputDecoration(
                      hintText: AppStrings.phoneHint,
                      label: Text(AppStrings.phone),
                    ),
                  ),

                  const SizedBox(height: 48),

                  BlocConsumer<SignUpCubit, SignUpStates>(
                    listener: (context, state) {
                      if (state.signUpState.errorMessage != null &&
                          state.signUpState.errorMessage!.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: AppColors.errorColor,
                            content: Center(
                              child: Text(state.signUpState.errorMessage!),
                            ),
                          ),
                        );
                        state.signUpState.errorMessage = null;
                      } else if (state.signUpState.data != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: AppColors.successColor,
                            content: Center(
                              child: Text(AppStrings.registersuccessfuly),
                            ),
                          ),
                        );
                        Future.delayed(const Duration(seconds: 2), () {
                          if (!context.mounted) return;
                          Navigator.of(
                            context,
                          ).popAndPushNamed(AppRoutes.homeViewRouteName);
                        });
                      }
                    },
                    builder: (context, state) {
                      return FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: state.signUpState.isLoading
                              ? AppColors.grey
                              : AppColors.primary,
                        ),
                        onPressed: state.signUpState.isLoading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  context.read<SignUpCubit>().doEvent(
                                    SignUpEventSetUsers(
                                      request: SignUpRequest(
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        rePassword:
                                            confirmPasswordController.text,
                                        phone: phoneNumberController.text,
                                        username: userNameController.text,
                                      ),
                                    ),
                                  );
                                }
                              },
                        child: state.signUpState.isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: AppColors.whiteColor,
                                ),
                              )
                            : Text(AppStrings.signUpTitle),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  Text.rich(
                    TextSpan(
                      text: AppStrings.alreadyhaveanaccount,
                      style: TextStyles.bodyRegular16,
                      children: [
                        TextSpan(
                          text: AppStrings.loginTitle,
                          style: TextStyles.bodyMedium16PrimaryUnderline,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacementNamed(
                                AppRoutes.loginViewRouteName,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
