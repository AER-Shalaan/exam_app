import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/auth/token_manager.dart';
import 'package:exam_app/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TokenManager.init();
  configureDependencies();
  runApp(const MyApp());
}
