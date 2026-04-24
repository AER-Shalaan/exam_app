import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/presentation/args/exam_score.dart';
import 'package:exam_app/features/question/presentation/cubit/question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScore extends StatelessWidget {
  final ExamScoreArgs args;

  const ExamScore({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final examScoreModel = args.examScoreModel;
    final correctCount = examScoreModel.correct ?? 0;
    final totalCount = int.tryParse(examScoreModel.total ?? '') ?? 10;
    final wrongCount =
        examScoreModel.wrong ?? examScoreModel.wrongQuestions?.length ?? 0;
    final answeredCount = correctCount + wrongCount;
    final correctPercent = answeredCount == 0
        ? 0.0
        : (correctCount / answeredCount).clamp(0.0, 1.0);
    final wrongPercent =
        answeredCount == 0 ? 0.0 : (wrongCount / answeredCount).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(Assets.assetsIconsArrowBack),
        title: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text("Exam Score"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<QuestionCubit, QuestionState>(
          listener: (context, state) {
            if (state.checkQuestionState.errorMessage != null &&
                state.checkQuestionState.errorMessage!.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.checkQuestionState.errorMessage!),
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your score", style: TextStyles.bodyMedium18),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularPercentIndicator(
                          percent: correctPercent,
                          radius: 50,
                          lineWidth: 5,
                          animation: true,
                          animateFromLastPercent: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppColors.primary,
                          backgroundColor: AppColors.errorColor,
                        ),
                        Text(
                          '$correctCount/$totalCount',
                          style: TextStyles.scoreText.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(width: 23),
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
                            const SizedBox(width: 65),
                            CircularPercentIndicator(
                              radius: 10,
                              lineWidth: 1.5,
                              backgroundColor: AppColors.primary,
                              percent: correctPercent,
                              progressColor: AppColors.primary,
                              center: Text(
                                correctCount.toString(),
                                style: TextStyles.scoreText.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Incorrect",
                              style: TextStyles.bodyMedium16.copyWith(
                                color: AppColors.errorColor,
                              ),
                            ),
                            const SizedBox(width: 55),
                            CircularPercentIndicator(
                              radius: 10,
                              lineWidth: 1.5,
                              backgroundColor: AppColors.errorColor,
                              percent: wrongPercent,
                              progressColor: AppColors.errorColor,
                              center: Text(
                                wrongCount.toString(),
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
                const SizedBox(height: 80),
                FilledButton(
                  onPressed: () {},
                  child: const Text("Show results"),
                ),
                const SizedBox(height: 24),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutesName.questions,
                      arguments: args.examId,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text("Start again"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
