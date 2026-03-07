import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyles.appBarTextStyle,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.baseBlack),
      elevation: 0,
    ),

    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     foregroundColor: AppColors.baseBlack,
    //     side: BorderSide(color: AppColors.baseBlack),
    //     textStyle: TextStyles.buttonTextStyle,
    //   ),
    // ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: .never,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.baseBlack),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.baseBlack),
      ),
      labelStyle: TextStyles.labelTextFieldStyle,
    ),

    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   selectedItemColor:AppColors.primary ,
    //   unselectedItemColor:AppColors.baseBlack20 ,
    //   backgroundColor: AppColors.lightBlue,
    //   elevation: 0,
    //   selectedLabelStyle: ,
    //   unselectedLabelStyle: ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: Colors.white,
    //   foregroundColor: Colors.white,
    //   elevation: 4,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: AppColors.primary,
    //     foregroundColor: Colors.white,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    //     textStyle: TextStyles.buttonTextStyle,
    //   ),
    // ),
  );
}
