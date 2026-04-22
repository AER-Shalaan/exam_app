import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/enter_email_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/enter_otp_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/pages/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  late final PageController _pageController;
  final _pages = const [EnterEmailView(), EnterOtpView(), ResetPasswordView()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (prev, curr) => prev.step != curr.step,
      listener: _onStepChanged,
      child: _buildPageView(),
    );
  }

  void _onStepChanged(BuildContext context, ForgetPasswordStates state) {
    if (!mounted) return;

    _pageController.animateToPage(
      state.step.index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: _pages,
    );
  }
}
