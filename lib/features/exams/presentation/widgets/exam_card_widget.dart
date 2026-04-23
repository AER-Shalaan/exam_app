import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/features/exams/domain/entities/exam_entity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExamCardWidget extends StatelessWidget {
  final ExamEntity exam;
  final bool isInteractive;

  const ExamCardWidget({
    super.key,
    required this.exam,
    this.isInteractive = true,
  });

  @override
  Widget build(BuildContext context) {
    final canOpenExam = isInteractive && exam.id != null;
    return InkWell(
      onTap: canOpenExam
          ? () {
              Navigator.pushNamed(
                context,
                AppRoutesName.startExam,
                arguments: exam,
              );
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset(
                  Assets.assetsImagesProfit,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        exam.title ?? AppStrings.defaultExamTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.baseBlack,
                        ),
                      ),
                      Text(
                        '${exam.duration ?? 0} ${AppStrings.minutes}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const Gap(4),
                  Text(
                    '${exam.numberOfQuestions ?? 0} ${AppStrings.questions}',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Text(
                        AppStrings.from,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const Text(
                        AppStrings.fromTime,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(16),
                      Text(
                        AppStrings.to,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const Text(
                        AppStrings.toTime,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
