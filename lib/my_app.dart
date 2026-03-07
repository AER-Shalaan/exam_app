import 'package:exam_app/core/values/routing/app_router.dart';
import 'package:exam_app/feature/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomeScreen(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
