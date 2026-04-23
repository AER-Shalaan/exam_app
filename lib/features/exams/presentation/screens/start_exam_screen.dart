import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/features/exams/domain/entities/exam_entity.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:gap/gap.dart';

import 'package:exam_app/core/values/app_strings.dart';

class StartExamScreen extends StatelessWidget {
  final ExamEntity exam;

  const StartExamScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.baseBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.assignment,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: Text(
                    exam.title ?? "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.baseBlack,
                    ),
                  ),
                ),
                Text(
                  "${exam.duration ?? 0} ${AppStrings.minutes}",
                  style: TextStyle(fontSize: 14, color: AppColors.primary),
                ),
              ],
            ),
            const Gap(16),
            Row(
              children: [
                const Text(
                  AppStrings.examLevel,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.baseBlack,
                  ),
                ),
                const Gap(8),
                Text(
                  '|',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
                ),
                const Gap(8),
                Text(
                  "${exam.numberOfQuestions ?? 0} ${AppStrings.questions}",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ),
            const Gap(24),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutesName.questions,
                    arguments: exam.id!,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                ),
                child: const Text(
                  AppStrings.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Gap(24), // Bottom padding
          ],
        ),
      ),
    );
  }
}
