import 'package:exam_app/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'config/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: AppRoutes.getRoutes(),
    );
  }
}
