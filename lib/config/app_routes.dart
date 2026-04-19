import 'package:exam_app/features/auth/sign_up/presentation/screens/sign_up_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/forget_password_view.dart';
import 'package:exam_app/features/auth/login/presentation/pages/login_view.dart';
import 'package:exam_app/features/home/presentation/home_view.dart';
import 'package:exam_app/features/splash_screen/presentation/splash_screen.dart';
import 'package:exam_app/features/exams/presentation/screens/languages_screen.dart';
import 'package:exam_app/features/exams/presentation/screens/start_exam_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashRouteName = "splash";
  static const String signUpViewRouteName = "SignUpView";
  static const String loginViewRouteName = "LoginView";
  static const String forgotPasswordRouteName = "ForgotPasswordView";
  static const String homeViewRouteName = "HomeView";
  static const String languagesScreenRouteName = "LanguagesScreen";
  static const String startExamScreenRouteName = "StartExamScreen";

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      splashRouteName: (_) => const SplashView(),
      loginViewRouteName: (_) => LoginView(),
      signUpViewRouteName: (_) => SignUpView(),
      forgotPasswordRouteName: (context) => ForgetPasswordView(),
      homeViewRouteName: (_) => HomeView(),
      languagesScreenRouteName: (_) => const LanguagesScreen(),
      startExamScreenRouteName: (_) => const StartExamScreen(),

    };
  }
}
