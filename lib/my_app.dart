import 'package:exam_app/config/app_theme.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:flutter/material.dart';

import 'config/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.examScoreRouteName,
      routes: AppRoutes.getRoutes(),
    );
  }
}
