import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';

class ConfirmResetNewPasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueNotifier<bool> isConfirmPasswordHidden;

  const ConfirmResetNewPasswordField({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isConfirmPasswordHidden,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isConfirmPasswordHidden,
      builder: (_, hidden, _) {
        return TextFormField(
          controller: confirmPasswordController,
          obscureText: hidden,
          decoration: InputDecoration(
            labelText: AppStrings.confirmPassword,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                hidden
                    ? Assets.assetsIconsVisibilityOff
                    : Assets.assetsIconsVisibility,
              ),
              onPressed: () =>
                  isConfirmPasswordHidden.value = !hidden,
            ),
          ),
          validator: (value) {
            return AppValidation.validatePasswordConfirmation(
              passwordController.text,
              value,
            );
          },
        );
      },
    );
  }
}