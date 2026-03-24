import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';
import 'package:exam_app/features/auth/sign_up/apis/sign_up_request/sign_up_request.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entitiies.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_events.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SiginUpView extends StatefulWidget {
  const SiginUpView({super.key});

  @override
  State<SiginUpView> createState() => _SiginUpViewState();
}

class _SiginUpViewState extends State<SiginUpView> {
  bool isClicked = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        title: Text(AppStrings.signUpTitle),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.assetsIconsArrowBack),
        ),
      ),
      body: Form(
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
                        validator: (value) =>
                            AppValidation.validateRequired(value),
                        controller: firstNameController,
                        decoration: InputDecoration(
                          hintText: AppStrings.firstnameHint,
                          label: Text(AppStrings.firstName),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            AppValidation.validateRequired(value),
                        controller: lastNameController,
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
                  validator: (value) => AppValidation.validateEmail(value),
                  controller: emailController,
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
                        validator: (value) =>
                            AppValidation.validatePassword(value),
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: AppStrings.passwordHint,
                          label: Text(AppStrings.password),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            AppValidation.validatePasswordConfirmation(
                              passwordController.text,
                              value,
                            ),
                        controller: confirmPasswordController,
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
                  validator: (value) => AppValidation.validatePhone(value),
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    hintText: AppStrings.phoneHint,
                    label: Text(AppStrings.phone),
                  ),
                ),
                const SizedBox(height: 48),
                BlocListener<SignUpCubit, BaseState<SignUpEntitiies>>(
                  listener: (context, state) {
                    final signUpState = state;
                    if (signUpState.isLoading) {
                      const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: AppColors.whiteColor,
                        ),
                      );
                    } else if ((signUpState.errorMessage ?? '').isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppColors.errorColor,
                          content: Center(child: Text(state.errorMessage!)),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppColors.successColor,
                          content: Center(
                            child: Text(AppStrings.registersuccessfuly),
                          ),
                        ),
                      );
                    }
                  },

                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: isClicked
                          ? AppColors.primary
                          : AppColors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isClicked = true;
                      });
                      if (formKey.currentState!.validate()) {
                        context.read<SignUpCubit>().doEvent(
                          SignUpEventSetUsers(
                            request: SignUpRequest(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              rePassword: confirmPasswordController.text,
                              phone: phoneNumberController.text,
                              username: userNameController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(AppStrings.signUpTitle),
                  ),
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
                            //Navigator.pushNamed(context, AppRoutes.loginViewRouteName);
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
    );
  }
}
