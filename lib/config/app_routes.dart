import 'package:exam_app/features/auth/sign_up/presentation/screens/sign_up_view.dart';
import 'package:exam_app/features/home/home_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashRouteName = "splash";
  static const String signUpViewRouteName = "SignUpView";
  static const String loginViewRouteName = "LoginView";
  static const String forgotPasswordRouteName = "ForgotPasswordView";
  static const String homeViewRouteName = "HomeView";

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      // example
      // splashRouteName: (_) => const SplashView(),
      signUpViewRouteName: (_) => SignUpView(),
      homeViewRouteName: (_) => const HomeView(),
    };
  }
}
