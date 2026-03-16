import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/presentation/cubit/login_events.dart';
import 'package:exam_app/features/auth/login/presentation/cubit/login_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isRememberMe = ValueNotifier<bool>(false);
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appBarLogin)),
      body: BlocConsumer<LoginScreenCubit, BaseState>(
        listener: (context, state) {
          if (state.isLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Center(child: Text("Loading..."))),
            );
          } else if ((state.errorMessage ?? '').isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: AppColors.errorColor,
                content: Text(state.errorMessage!),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: AppColors.successColor,
                content: Center(child: Text(AppStrings.loginsuccessful)),
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),

                  TextFormField(
                    validator: (value) => AppValidation.validateEmail(value),
                    decoration: const InputDecoration(
                      labelText: AppStrings.email,
                      hintText: AppStrings.hintTextemail,
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const Gap(20),

                  TextFormField(
                    validator: (value) => AppValidation.validatePassword(value),
                    decoration: const InputDecoration(
                      labelText: AppStrings.password,
                      hintText: AppStrings.hintTextpass,
                    ),
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),

                  const Gap(12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ValueListenableBuilder(
                            valueListenable: isRememberMe,
                            builder: (context, value, child) {
                              return SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: value,
                                  activeColor: AppColors.primary50,
                                  onChanged: (newValue) {
                                    isRememberMe.value = newValue ?? false;
                                  },
                                ),
                              );
                            },
                          ),
                          const Gap(8),
                          const Text(
                            AppStrings.rememberMe,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text(
                          AppStrings.forgetPasswordLogin,
                          style: TextStyle(
                            color: AppColors.baseBlack80,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Gap(20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary60,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (form.currentState!.validate()) {
                        context.read<LoginScreenCubit>().doEvent(
                          GetUser(
                            request: LoginRequest(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      AppStrings.loginTitle,
                      style: TextStyle(color: AppColors.primary10),
                    ),
                  ),

                  const Gap(12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.dontAcont),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text(
                          AppStrings.signUpTitle,
                          style: TextStyle(
                            color: AppColors.primary60,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
