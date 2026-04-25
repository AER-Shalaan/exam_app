import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/enums/home_tab.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/presentation/args/exam_score_args.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/entities/question_attempt_entity.dart';
import 'package:exam_app/features/results/presentation/cubit/result_cubit.dart';
import 'package:exam_app/features/results/presentation/cubit/result_event.dart';
import 'package:exam_app/features/results/presentation/cubit/result_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScore extends StatelessWidget {
  final ExamScoreArgs args;

  const ExamScore({super.key, required this.args});

  ExamAttemptEntity _buildAttempt() {
    final examScoreModel = args.examScoreModel;
    final questions =
        args.questionCubit.state.questionState.data?.questions ?? [];

    final attempt = ExamAttemptEntity(
      examId: args.examId,
      examTitle: questions.isNotEmpty ? questions.first.exam.title : '',
      subjectName: questions.isNotEmpty
          ? questions.first.subject?.name ?? ''
          : '',
      duration: args.elapsedTime,
      
      examDuration: questions.isNotEmpty ? questions.first.exam.duration : null,
      correctCount: examScoreModel.correct,
      wrongCount: examScoreModel.wrong,
      total: questions.length,
      questions: questions
          .map(
            (q) => QuestionAttemptEntity(
              questionId: q.id,
              question: q.question,
              selectedAnswer: q.selectedAnswerKeys.isNotEmpty
                  ? q.answers
                        .firstWhere((a) => a.key == q.selectedAnswerKeys.first)
                        .answer
                  : null,
              correctAnswer: q.answers
                  .firstWhere(
                    (a) => a.key == q.correct,
                    orElse: () => q.answers.first,
                  )
                  .answer,
              answers: q.answers.map((a) => a.answer).toList(),
            ),
          )
          .toList(),
    );

    return attempt;
  }

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
    final wrongPercent = answeredCount == 0
        ? 0.0
        : (wrongCount / answeredCount).clamp(0.0, 1.0);

    return BlocProvider(
      create: (context) =>
          getIt.get<ResultCubit>()..doEvent(SaveResultEvent(_buildAttempt())),
      child: Scaffold(
        appBar: AppBar(
          leading: SvgPicture.asset(Assets.assetsIconsArrowBack),
          title: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("Exam Score"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<ResultCubit, ResultState>(
            listener: (context, state) {
              if (state.resultsState.errorMessage != null &&
                  state.resultsState.errorMessage!.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.resultsState.errorMessage!)),
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
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutesName.home,
                        (route) => false,
                        arguments: HomeTab.result,
                      );
                    },
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
      ),
    );
  }
}
