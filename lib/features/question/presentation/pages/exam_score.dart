import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/data/models/check_questions/request/question_request.dart';
import 'package:exam_app/features/question/domain/entities/check_questions/check_questions_response/check_question_response_entity.dart';
import 'package:exam_app/features/question/presentation/cubit/question_cubit.dart';
import 'package:exam_app/features/question/presentation/cubit/question_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:exam_app/core/values/app_routes_name.dart';

class ExamScore extends StatelessWidget {
  final CheckQuestionsResponseEntity examScoreModel;
  const ExamScore({super.key, required this.examScoreModel});

  @override
  Widget build(BuildContext context) {
    final correctCount = examScoreModel.correct ?? 0;
    final totalCount = int.tryParse(examScoreModel.total ?? '') ?? 0;
    final wrongCount =
        examScoreModel.wrong ?? examScoreModel.wrongQuestions?.length ?? 0;
    final percent = totalCount == 0 ? 0.0 : correctCount / totalCount;
    final servicelocator = getIt.get<QuestionCubit>();

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
        child: BlocProvider(
          create: (context) => servicelocator
            ..doQuestionEvent(CheckQuestionsUseCase(
                questionRequest: QuestionRequest(
                    // answers: ,time:
                    ))),
          child: BlocConsumer<QuestionCubit, QuestionState>(
            listener: (context, state) {
              if (state.checkQuestionState.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.checkQuestionState.errorMessage!),
                ));
              }
              if (state.checkQuestionState.data != null) {
                print("success");
              }
            },
            builder: (context, state) {
              return Column(
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
                          '$correctCount/$totalCount',
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
                                percent: totalCount == 0
                                    ? 0.0
                                    : correctCount / totalCount,
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
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "Incorrect",
                                style: TextStyles.bodyMedium16.copyWith(
                                  color: AppColors.errorColor,
                                ),
                              ),
                              SizedBox(width: 55),
                              CircularPercentIndicator(
                                radius: 10,
                                lineWidth: 1.5,
                                backgroundColor: AppColors.errorColor,
                                percent: totalCount == 0
                                    ? 0.0
                                    : wrongCount / totalCount,
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
                  SizedBox(height: 80),
                  FilledButton(onPressed: () {}, child: Text("Show results")),
                  SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutesName.questions,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
