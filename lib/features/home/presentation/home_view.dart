import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/core/auth/token_manager.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: AppColors.baseBlack,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColors.errorColor),
            tooltip: 'Logout',
            onPressed: () {
              TokenManager.clearToken();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.loginViewRouteName,
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Student 👋',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.baseBlack,
              ),
            ),
            const Gap(8),
            const Text(
              'What would you like to learn today?',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.baseBlack40,
              ),
            ),
            const Gap(32),
            _buildFeatureCard(
              context: context,
              title: 'Explore Exams',
              subtitle: 'Test your knowledge across various subjects',
              icon: Icons.menu_book_rounded,
              color: AppColors.primary,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.languagesScreenRouteName);
              },
            ),
            const Gap(16),
            _buildFeatureCard(
              context: context,
              title: 'My Results',
              subtitle: 'Track your progress and scores',
              icon: Icons.bar_chart_rounded,
              color: AppColors.baseBlack,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Coming Soon!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const Gap(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color == AppColors.primary ? color : AppColors.baseBlack,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.baseBlack40,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: color.withOpacity(0.5), size: 20),
          ],
        ),
      ),
    );
  }
}
