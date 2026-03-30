import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, required this.icon, required this.name});
  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.baseBlack10,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Image.network(
              icon,
              height: 48,
              width: 48,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const CircularProgressIndicator();
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            const SizedBox(width: 16),
            Text(name, style: TextStyles.bodyRegular16),
          ],
        ),
      ),
    );
  }
}