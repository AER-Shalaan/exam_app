import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/enter_email_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/enter_otp_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
  final ForgetPasswordViewModel forgetPasswordViewModel = getIt
      .get<ForgetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordViewModel>(
      create: (context) => forgetPasswordViewModel,
      child: _ForgetPasswordView(),
    );
  }
}

class _ForgetPasswordView extends StatelessWidget {
  const _ForgetPasswordView();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.password),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PageView(
        controller: viewModel.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [EnterEmailView(), EnterOtpView(), ResetPasswordView()],
      ),
    );
  }
}
