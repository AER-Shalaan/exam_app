import 'package:exam_app/features/auth/sign_up/presentation/screens/sign_up_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/forget_password_view.dart';
import 'package:exam_app/features/auth/login/presentation/pages/login_view.dart';
import 'package:exam_app/features/home/presentation/home_view.dart';
import 'package:exam_app/features/splash_screen/presentation/splash_screen.dart';
import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoutesName.signUp:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case AppRoutesName.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case AppRoutesName.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      case AppRoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text(AppStrings.routeNotFound)),
          ),
        );
    }
  }
}
