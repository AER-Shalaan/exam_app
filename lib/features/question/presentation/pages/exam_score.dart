import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScore extends StatelessWidget {
  const ExamScore({super.key, required this.correct, required this.total});
  final int correct;
  final int total;
  @override
  Widget build(BuildContext context) {
    double percent = correct / total;
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
          crossAxisAlignment: .start,
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
                    "80%",
                    style: TextStyles.scoreText.copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(width: 23),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "correct",
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
                            "18",
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
                          "incorrect",
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
                            "2",
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
              onPressed: () {},
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
