import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/core/auth/token_manager.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final token = TokenManager.token;
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: Text('your token is $token')),
            SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                TokenManager.clearToken();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.loginViewRouteName,
                  (route) => false,
                );
              },
              child: const Text('logout'),
            ),
          ],
        ),
      ),
    );
  }
}
