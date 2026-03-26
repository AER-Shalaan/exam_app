import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/presentation/cubit/login_events.dart';
import 'package:exam_app/features/auth/login/presentation/cubit/login_states.dart';
import 'package:exam_app/features/auth/login/presentation/cubit/login_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final loginViewModel = getIt<LoginViewModel>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isPasswordHidden = ValueNotifier(true);
  final ValueNotifier<bool> isRememberMe = ValueNotifier<bool>(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: const Text(AppStrings.loginTitle),
        ),
      ),
      body: BlocProvider(
        create: (context) => loginViewModel,
        child: BlocConsumer<LoginViewModel, LoginStates>(
          listener: (context, state) {
            final loginState = state.loginState;
            if (loginState.errorMessage != null &&
                loginState.errorMessage!.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.assetsIconsWarning,
                        colorFilter: ColorFilter.mode(
                          AppColors.whiteColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Gap(4),
                      Text(loginState.errorMessage!),
                    ],
                  ),
                  backgroundColor: AppColors.errorColor,
                ),
              );
              state.loginState.errorMessage = null;
            } else if (loginState.data != null) {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.homeViewRouteName,
              );
            }
          },
          builder: (context, state) {
            final loginState = state.loginState;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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

                    const Gap(24),

                    ValueListenableBuilder(
                      valueListenable: isPasswordHidden,
                      builder: (BuildContext context, hidden, _) {
                        return TextFormField(
                          controller: passwordController,
                          obscureText: hidden,
                          decoration: InputDecoration(
                            labelText: AppStrings.password,
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

                          validator: (value) =>
                              AppValidation.validatePassword(value),
                        );
                      },
                    ),

                    const Gap(12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ValueListenableBuilder<bool>(
                              valueListenable: isRememberMe,
                              builder: (context, value, child) {
                                return Checkbox(
                                  value: value,
                                  activeColor: AppColors.primary,
                                  onChanged: (newValue) {
                                    isRememberMe.value = newValue ?? false;
                                  },
                                );
                              },
                            ),
                            Text(
                              AppStrings.rememberMe,
                              style: TextStyles.bodyRegular13,
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.forgotPasswordRouteName,
                            );
                          },
                          child: Text(
                            '${AppStrings.forgotPasswordTitle} ?',
                            style: TextStyles.bodyRegularUnderLine12,
                          ),
                        ),
                      ],
                    ),
                    const Gap(48),

                    FilledButton(
                      onPressed: loginState.isLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginViewModel>().doEvent(
                                  LoginUserEvent(
                                    request: LoginRequest(
                                      email: emailController.text.trim(),
                                      password: passwordController.text,
                                    ),
                                    rememberMe: isRememberMe.value,
                                  ),
                                );
                              }
                            },

                      child: loginState.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: AppColors.whiteColor,
                              ),
                            )
                          : const Text(AppStrings.loginTitle),
                    ),

                    const Gap(16),

                    Text.rich(
                      TextSpan(
                        text: AppStrings.dontAcont,
                        style: TextStyles.bodyRegular16,
                        children: [
                          TextSpan(
                            text: AppStrings.signUpTitle,
                            style: TextStyles.bodyMedium16PrimaryUnderline,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacementNamed(
                                  AppRoutes.signUpViewRouteName,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
