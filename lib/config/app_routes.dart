import 'package:exam_app/features/auth/presentation/pages/login_screen.dart';
import 'package:exam_app/features/splash_screen/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashRouteName = "splash";
  static const String signUpViewRouteName = "SignUpView";
  static const String loginViewRouteName = "LoginView";
  static const String forgotPasswordRouteName = "ForgotPasswordView";

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      // example
      splashRouteName: (_) => const SplashView(),
      loginViewRouteName: (_) => LoginView(),
    };
  }
}
