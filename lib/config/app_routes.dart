import 'package:exam_app/features/auth/login/presentation/pages/login_view.dart';
import 'package:exam_app/features/home/presentation/home_view.dart';
import 'package:exam_app/features/splash_screen/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashRouteName = "splash";
  static const String signUpViewRouteName = "SignUpView";
  static const String loginViewRouteName = "LoginView";
  static const String forgotPasswordRouteName = "ForgotPasswordView";
  static const String homeViewRouteName = "HomeView";

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      splashRouteName: (_) => const SplashView(),
      loginViewRouteName: (_) => LoginView(),
      homeViewRouteName: (_) => HomeView(),

    };
  }
}
