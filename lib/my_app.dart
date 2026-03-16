import 'package:exam_app/config/app_theme.dart';
import 'package:exam_app/features/auth/login/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'config/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
      title: 'Exam App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: AppRoutes.getRoutes(),
    );
  }
}
