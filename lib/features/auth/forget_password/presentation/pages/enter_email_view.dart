import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:exam_app/features/auth/forget_password/presentation/widgets/enter_email_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterEmailView extends StatefulWidget {
  const EnterEmailView({super.key});

  @override
  State<EnterEmailView> createState() => _EnterEmailViewState();
}

class _EnterEmailViewState extends State<EnterEmailView> {
  late final TextEditingController emailController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();

    return EnterEmailBody(
      formKey: formKey,
      emailController: emailController,
      viewModel: viewModel,
    );
  }
}
