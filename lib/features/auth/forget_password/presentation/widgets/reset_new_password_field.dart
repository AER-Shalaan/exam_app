import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';

class ResetNewPasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final ValueNotifier<bool> isPasswordHidden;

  const ResetNewPasswordField({
    super.key,
    required this.passwordController,
    required this.isPasswordHidden,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isPasswordHidden,
      builder: (_, hidden, __) {
        return TextFormField(
          controller: passwordController,
          obscureText: hidden,
          decoration: InputDecoration(
            labelText: AppStrings.newPassword,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                hidden
                    ? Assets.assetsIconsVisibilityOff
                    : Assets.assetsIconsVisibility,
              ),
              onPressed: () =>
                  isPasswordHidden.value = !hidden,
            ),
          ),
          validator: AppValidation.validatePassword,
        );
      },
    );
  }
}