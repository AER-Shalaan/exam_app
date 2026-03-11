import 'package:exam_app/features/Auth/forget_password/presentation/forget_password_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashRouteName = "splash";
  static const String signUpViewRouteName = "SignUpView";
  static const String loginViewRouteName = "LoginView";
  static const String forgotPasswordRouteName = "ForgotPasswordView";

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      forgotPasswordRouteName: (context) => ForgetPasswordView(),
    };
  }
}
