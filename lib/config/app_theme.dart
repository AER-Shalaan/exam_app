import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.whiteColor,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.whiteColor,
      error: AppColors.errorColor,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyles.appBarTextStyle,
      titleSpacing: 0,
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.baseBlack, size: 24),
      leadingWidth: 20,
    ),
    //===========================textFormFieldStyle
    inputDecorationTheme: InputDecorationTheme(
      prefixIconConstraints: const BoxConstraints(minHeight: 24, maxHeight: 24),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return TextStyles.labelTextFieldStyle.copyWith(
            color: AppColors.errorColor,
          );
        }
        if (states.contains(WidgetState.focused)) {
          return TextStyles.labelTextFieldStyle.copyWith(
            color: AppColors.baseBlack,
          );
        }
        return TextStyles.labelTextFieldStyle;
      }),
      labelStyle: TextStyles.labelTextFieldStyle,
      errorStyle: TextStyles.errorTextFieldStyle,
      hintStyle: TextStyles.hintTextFieldStyle,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.baseBlack),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
    ),
    //================================== filledButtonTheme
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(AppColors.whiteColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          const Size(double.infinity, 48),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyles.buttonTextStyle,
        ),
      ),
    ),
    //outlinedButtonTheme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(color: AppColors.primary),
        ),
        foregroundColor: WidgetStateProperty.all(AppColors.primary),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        minimumSize: WidgetStateProperty.all<Size>(const Size(162, 48)),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyles.buttonTextStyle,
        ),
      ),
    ),
  );
}
