import 'package:exam_app/feature/sign_up/presentation/screens/sigin_up_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashRouteName = "splash";
  static const String signUpViewRouteName = "SignUpView";
  static const String loginViewRouteName = "LoginView";
  static const String forgotPasswordRouteName = "ForgotPasswordView";

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      // example
      // splashRouteName: (_) => const SplashView(),
      signUpViewRouteName: (_) => SiginUpView(),
    };
  }
}
