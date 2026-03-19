import 'package:exam_app/core/storage/secure_storage.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final token = SecureStorage.getToken();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('your token is $token'),
      ),
    );
  }
}
