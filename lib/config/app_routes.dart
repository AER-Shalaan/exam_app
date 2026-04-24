import 'package:exam_app/features/auth/forget_password/presentation/forget_password_view.dart';
import 'package:exam_app/features/auth/login/presentation/pages/login_view.dart';
import 'package:exam_app/features/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/exams/presentation/args/exams_args.dart';
import 'package:exam_app/features/exams/presentation/screens/start_exam_screen.dart';
import 'package:exam_app/features/exams/presentation/screens/subject_exams_screen.dart';
import 'package:exam_app/features/auth/sign_up/presentation/screens/sign_up_view.dart';
import 'package:exam_app/features/home/presentation/home_view.dart';
import 'package:exam_app/features/question/presentation/args/exam_score.dart';
import 'package:exam_app/features/question/presentation/pages/exam_score.dart';
import 'package:exam_app/features/question/presentation/pages/questions.dart';
import 'package:exam_app/features/splash_screen/presentation/splash_screen.dart';
import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return MaterialPageRoute(builder: (_) => HomeView());
      case AppRoutesName.examsOnsubject:
        final args = settings.arguments as ExamsArgs;
        return MaterialPageRoute(
          builder: (_) => SubjectExamsScreen(
            subjectId: args.subjectId,
            subjectName: args.subjectName,
          ),
        );
      case AppRoutesName.startExam:
        final exam = settings.arguments as ExamEntity;
        return MaterialPageRoute(builder: (_) => StartExamScreen(exam: exam));
      case AppRoutesName.questions:
        final examId = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Questions(examId: examId));
      case AppRoutesName.examScore:
        final args = settings.arguments as ExamScoreArgs;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: args.questionCubit,
            child: ExamScore(args: args),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text(AppStrings.routeNotFound)),
          ),
        );
    }
  }
}
