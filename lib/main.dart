import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
