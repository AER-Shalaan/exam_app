import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/features/auth/presentation/cubit/login_screen_cubit.dart';
import 'package:exam_app/features/auth/presentation/cubit/login_screen_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isRememberMe = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<GetUserCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text(AppStrings.appBarLogin)),
        body: BlocConsumer<GetUserCubit, BaseState>(
          listener: (context, state) {
            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage.toString())),
              );
            } else if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(AppStrings.loginsuccessful)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: AppStrings.email,
                        hintText: AppStrings.hintTextemail,
                      ),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const Gap(20),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: AppStrings.password,
                        hintText: AppStrings.hintTextpass,
                      ),
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
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
                          onPressed: () {
                            // Navigator.push(

                            //   context,

                            //   MaterialPageRoute(builder: (context) => forget()),
                          },
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
                        // Navigator.push(

                        //   context,

                        //   MaterialPageRoute(builder: (context) => home viwe()),
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
                          onPressed: () {
                            // Navigator.push(

                            //   context,

                            //   MaterialPageRoute(builder: (context) => signup()),
                          },
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
      ),
    );
  }
}
