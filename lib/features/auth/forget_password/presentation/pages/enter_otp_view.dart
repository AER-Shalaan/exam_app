import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_events.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_states.dart';
import 'package:exam_app/features/auth/forget_password/presentation/cubit/forget_password_view_model.dart';
import 'package:exam_app/features/auth/forget_password/presentation/widgets/enter_otp_body.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterOtpView extends StatefulWidget {
  const EnterOtpView({super.key});

  @override
  State<EnterOtpView> createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends State<EnterOtpView> {
  late final TextEditingController otpController;
  late final TapGestureRecognizer _resendRecognizer;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();

    _resendRecognizer = TapGestureRecognizer()..onTap = _onResendTap;
  }

  void _onResendTap() {
    final viewModel = context.read<ForgetPasswordViewModel>();

    viewModel.doEvent(ResendCodeEvent());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppStrings.resendCodeSuccess),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  void dispose() {
    otpController.dispose();
    _resendRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();
    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          previous.verifyResetState.isLoading &&
          !current.verifyResetState.isLoading,

      listener: (context, state) {
        if (state.verifyResetState.data != null) {
          viewModel.doEvent(NextPageEvent());
        }
      },
      buildWhen: (previous, current) =>
          previous.verifyResetState != current.verifyResetState,
      builder: (context, state) {
        return enterOtpBody(
          otpController: otpController,
          viewModel: viewModel,
          resendRecognizer: _resendRecognizer,
          state: state,
        );
      },
    );
  }
}
