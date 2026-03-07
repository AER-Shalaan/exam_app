import 'package:flutter/material.dart';
import 'config/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: AppRoutes.getRoutes(),
    );
  }
}
