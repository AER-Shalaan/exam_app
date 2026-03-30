import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/core/auth/token_manager.dart';
import 'package:exam_app/features/home/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () {
            TokenManager.clearToken();
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.loginViewRouteName,
              (route) => false,
            );
          },
          child: Text("logout"),
        ),
      ],
    );
  }
}
