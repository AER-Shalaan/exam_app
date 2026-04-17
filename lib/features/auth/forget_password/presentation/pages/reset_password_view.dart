import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:exam_app/features/auth/forget_password/presentation/widgets/reset_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      listener: (context, state) => _handleListener(context, state),
      buildWhen: (previous, current) =>
          previous.resetPasswordState.isLoading !=
          current.resetPasswordState.isLoading,
      builder: (context, state) {
        return resetPasswordBody(
          formKey: _formKey,
          passwordController: passwordController,
          isPasswordHidden: isPasswordHidden,
          confirmPasswordController: confirmPasswordController,
          isConfirmPasswordHidden: isConfirmPasswordHidden,
          viewModel: viewModel,
          state: state,
        );
      },
    );
  }

  void _handleListener(BuildContext context, ForgetPasswordStates state) {
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
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.loginViewRouteName,
                  (route) => false,
                );
              },
              child: const Text(AppStrings.login),
            ),
          ],
        ),
      );
    }
  }
}
