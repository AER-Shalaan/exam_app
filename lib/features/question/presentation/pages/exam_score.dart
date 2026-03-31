import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/data/models/check_questions/exam_score/exam_score_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScore extends StatelessWidget {
  const ExamScore({super.key, required this.examScoreModel});
  final ExamScoreModel examScoreModel;
  @override
  Widget build(BuildContext context) {
    double percent = examScoreModel.correct / examScoreModel.total;

    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(Assets.assetsIconsArrowBack),
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text("Exam Score"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your score", style: TextStyles.bodyMedium18),
            SizedBox(height: 24),
            Row(
              children: [
                CircularPercentIndicator(
                  percent: percent,
                  radius: 50,
                  progressColor: AppColors.primary,
                  backgroundColor: AppColors.errorColor,
                  center: Text(
                    examScoreModel.percent.toString(),
                    style: TextStyles.scoreText.copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(width: 23),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Correct",
                          style: TextStyles.bodyMedium16.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 65),
                        CircularPercentIndicator(
                          radius: 10,
                          lineWidth: 1.5,
                          backgroundColor: AppColors.primary,
                          center: Text(
                            examScoreModel.correct.toString(),
                            style: TextStyles.scoreText.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Incorrect",
                          style: TextStyles.bodyMedium16.copyWith(
                            color: AppColors.errorColor,
                          ),
                        ),
                        SizedBox(width: 50),
                        CircularPercentIndicator(
                          radius: 10,
                          lineWidth: 1.5,
                          backgroundColor: AppColors.errorColor,
                          center: Text(
                            examScoreModel.incorrect.toString(),
                            style: TextStyles.scoreText.copyWith(
                              color: AppColors.errorColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 80),
            FilledButton(onPressed: () {}, child: Text("Show results")),
            SizedBox(height: 24),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.questionsRouteName,
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(100),
                ),
              ),
              child: Text("Start again"),
            ),
          ],
        ),
      ),
    );
  }
}
