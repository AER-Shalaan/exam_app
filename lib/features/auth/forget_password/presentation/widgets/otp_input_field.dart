import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/text_styles.dart';

Widget otpInputField({
  required TextEditingController controller,
  required bool showError,
  String? errorMessage,
  required ValueChanged<String> onCompleted,
  required ValueChanged<String> onChanged,
}) {
   final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyles.bodyMedium18,
    decoration: BoxDecoration(
      color: AppColors.primary10,
      borderRadius: BorderRadius.circular(8),
    ),
  );

  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: AppColors.primary, width: 2),
  );

  final errorPinTheme = defaultPinTheme.copyDecorationWith(
    color: AppColors.whiteColor,
    border: Border.all(color: AppColors.errorColor, width: 2),
  );

  return Pinput(
    controller: controller,
    length: 6,
    keyboardType: TextInputType.number,
    showCursor: true,
    defaultPinTheme: defaultPinTheme,
    focusedPinTheme: focusedPinTheme,
    errorPinTheme: errorPinTheme,
    forceErrorState: showError,
    errorText: errorMessage,
    onCompleted: onCompleted,
    onChanged: onChanged,
  );
}
