import 'package:exam_app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle appBarTextStyle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.baseBlack,
  );

  static const TextStyle labelTextFieldStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static const TextStyle hintTextFieldStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.placeHolder,
    letterSpacing: 0.5,
  );

  static const TextStyle textFieldTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.baseBlack,
    letterSpacing: 0.5,
  );

  static TextStyle bodyRegularUnderLine12 = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.baseBlack,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.baseBlack,
  );

  static const TextStyle errorTextFieldStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle bodyRegular13 = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.baseBlack,
  );
  static TextStyle scoreText = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.baseBlack,
    letterSpacing: 0,
  );

  static TextStyle bodyRegular13grey = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static TextStyle bodyRegular16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.baseBlack,
  );

  static TextStyle bodyMedium16PrimaryUnderline = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primary,
  );

  static TextStyle bodyMedium18 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.baseBlack,
    letterSpacing: 0,
  );

  static TextStyle bodyMedium16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.baseBlack,
  );

  static TextStyle bodyMRegular14grey = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
}
