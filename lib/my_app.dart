import 'package:exam_app/config/app_theme.dart';
import 'package:exam_app/feature/sign_up/presentation/screens/sigin_up_view.dart';
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
      home: SiginUpView(),
      routes: AppRoutes.getRoutes(),
    );
  }
}
