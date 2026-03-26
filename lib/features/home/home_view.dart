import 'package:exam_app/core/auth/token_manager.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    String token = TokenManager.token??"";
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(child: Text('>>>>> $token')),
    );
  }
}
