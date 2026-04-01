import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/data/models/questions/exam_model/exam_model.dart';
import 'package:exam_app/features/question/presentation/cubit/question_cubit.dart';
import 'package:exam_app/features/question/presentation/cubit/question_event.dart';
import 'package:exam_app/features/question/presentation/widgets/custom_alert_dialog.dart';
import 'package:exam_app/features/question/presentation/widgets/exam_questions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    final questionGetIt = getIt.get<QuestionCubit>();

    return BlocProvider(
      create: (context) => questionGetIt
        ..doQuestionEvent(
          QuestionsUseCase(
            examId: "670070a830a3c3c1944a9c63",
          ),
        ),
        child: BlocListener<QuestionCubit, QuestionState>(
        listenWhen: (previous, current) =>
            previous.questionState.errorMessage !=
                current.questionState.errorMessage ||
            (!previous.isExamTimeFinished && current.isExamTimeFinished),
        listener: (context, state) async {
          if (state.questionState.errorMessage != null &&
              state.questionState.errorMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.questionState.errorMessage!)),
            );
          }

          if (state.isExamTimeFinished) {
            context.read<QuestionCubit>().stopExamTimer();
            await showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) => CustomAlertDialog(),
            );
          }
        },
        child: BlocBuilder<QuestionCubit, QuestionState>(
          builder: (context, state) {
            final questionCubit = context.read<QuestionCubit>();
            final questions = state.questionState.data?.questions ?? [];
            final hasQuestions = questions.isNotEmpty;
            final currentIndex = state.currentQuestionIndex;
            final currentQuestion =
                hasQuestions ? questions[currentIndex] : null;
            final isTimerInWarningState =
                questionCubit.isTimerInWarningState();
            final formattedRemainingTime =
                questionCubit.formattedRemainingTime();

            return Scaffold(
              appBar: AppBar(
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text(AppStrings.examTitle),
                ),
                leading: SvgPicture.asset(Assets.assetsIconsArrowBack, height: 20),
                actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: 24,
                          color: isTimerInWarningState
                              ? AppColors.errorColor
                              : AppColors.successColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          formattedRemainingTime,
                          style: TextStyles.appBarTextStyle.copyWith(
                            color: isTimerInWarningState
                                ? AppColors.errorColor
                                : AppColors.successColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        hasQuestions
                            ? "question ${currentIndex + 1} of ${questions.length}"
                            : "question 0 of 0",
                        style: TextStyles.bodyMedium16,
                        textAlign: TextAlign.center,
                      ),
                      LinearProgressIndicator(
                        value: hasQuestions
                            ? (currentIndex + 1) / questions.length
                            : 0,
                        backgroundColor: AppColors.grey,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        currentQuestion?.question ?? "No questions available.",
                        style: TextStyles.bodyMedium18,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (currentQuestion != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            currentQuestion.type == QuestionType.multipleChoice
                                ? "Choose one or more answers"
                                : "Choose one answer",
                            style: TextStyles.bodyMedium16.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: SizedBox(
                          key: ValueKey(currentIndex),
                          height: 256,
                          child: currentQuestion == null
                              ? const SizedBox.shrink()
                              : ExamQuestionsCard(
                                  questionModel: currentQuestion,
                                  onAnswerSelected: (selectedKey) {
                                    questionCubit.selectAnswer(
                                      currentIndex,
                                      selectedKey,
                                    );
                                  },
                                ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                if (!hasQuestions) return;
                                questionCubit.previousQuestion();
                              },
                              child: const Text("back"),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: FilledButton(
                              onPressed: () {
                                if (!hasQuestions) return;
                                if (currentIndex < questions.length - 1) {
                                  questionCubit.nextQuestion();
                                } else {
                                  questionCubit.stopExamTimer();
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.examScoreRouteName,
                                  );
                                }
                              },
                              style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text("next"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
