import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/validation/app_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget resetNewPasswordField({
  required TextEditingController passwordController,
  required ValueNotifier<bool> isPasswordHidden,
}) {
  return ValueListenableBuilder<bool>(
    valueListenable: isPasswordHidden,
    builder: (_, hidden, _) {
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
            onPressed: () => isPasswordHidden.value = !hidden,
          ),
        ),
        validator: AppValidation.validatePassword,
      );
    },
  );
}
