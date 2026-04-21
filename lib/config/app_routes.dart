import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/features/auth/forget_password/presentation/forget_password_view.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splash:
        return MaterialPageRoute(builder: (_) => const Scaffold());
      case AppRoutesName.signUp:
        return MaterialPageRoute(builder: (_) => const Scaffold());
      case AppRoutesName.login:
        return MaterialPageRoute(builder: (_) => const Scaffold());
      case AppRoutesName.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text(AppStrings.routeNotFound)),
          ),
        );
    }
  }
}
