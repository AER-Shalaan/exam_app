import 'package:exam_app/features/auth/sign_up/presentation/screens/sign_up_view.dart';
import 'package:exam_app/features/auth/forget_password/presentation/forget_password_view.dart';
import 'package:exam_app/features/auth/login/presentation/pages/login_view.dart';
import 'package:exam_app/features/splash_screen/presentation/splash_screen.dart';
import 'package:exam_app/features/auth/exams/presentation/screens/subject_exams_screen.dart';
import 'package:exam_app/features/auth/exams/presentation/screens/start_exam_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/features/auth/exams/presentation/cubit/exams_events.dart';
import 'package:exam_app/features/auth/exams/presentation/cubit/exams_view_model.dart';
abstract class AppRoutes {
  static const String splashRouteName = "splash";
  static const String signUpViewRouteName = "SignUpView";
  static const String loginViewRouteName = "LoginView";
  static const String forgotPasswordRouteName = "ForgotPasswordView";
  static const String subjectExamsScreenRouteName = "SubjectExamsScreen";
  static const String startExamScreenRouteName = "StartExamScreen";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRouteName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case loginViewRouteName:
        return MaterialPageRoute(builder: (_) => LoginView());
      case signUpViewRouteName:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case forgotPasswordRouteName:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      case subjectExamsScreenRouteName:
        final subjectId = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ExamsViewModel>()..add(GetExamsEvent(subjectId: subjectId)),
            child: SubjectExamsScreen(subjectId: subjectId),
          ),
        );
      case startExamScreenRouteName:
        final examId = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => StartExamScreen(examId: examId));
      default:
        return null;
    }
  }
}
