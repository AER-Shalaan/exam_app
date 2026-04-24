import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/presentation/args/exam_score.dart';
import 'package:exam_app/features/question/presentation/cubit/question_cubit.dart';
import 'package:exam_app/features/question/presentation/cubit/question_event.dart';
import 'package:exam_app/features/question/presentation/widgets/custom_alert_dialog.dart';
import 'package:exam_app/features/question/presentation/widgets/exam_questions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Questions extends StatelessWidget {
  final String examId;

  const Questions({super.key, required this.examId});

  @override
  Widget build(BuildContext context) {
    final questionGetIt = getIt.get<QuestionCubit>();

    return BlocProvider(
      create: (context) => questionGetIt
        ..doQuestionEvent(
          QuestionsUseCase(
            examId: examId,
          ),
        ),
      child: BlocConsumer<QuestionCubit, QuestionState>(
        listenWhen: (previous, current) =>
            previous.questionState.errorMessage !=
                current.questionState.errorMessage ||
            previous.checkQuestionState.errorMessage !=
                current.checkQuestionState.errorMessage ||
            previous.checkQuestionState.data != current.checkQuestionState.data ||
            (!previous.isExamTimeFinished && current.isExamTimeFinished),
        listener: (context, state) async {
          if (state.questionState.errorMessage != null &&
              state.questionState.errorMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.questionState.errorMessage!)),
            );
          }

          if (state.checkQuestionState.errorMessage != null &&
              state.checkQuestionState.errorMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.checkQuestionState.errorMessage!)),
            );
          }

          if (state.isExamTimeFinished) {
            context.read<QuestionCubit>().stopExamTimer();
            await showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) => const CustomAlertDialog(),
            );
            if (!context.mounted) return;
          }

          if (state.checkQuestionState.data != null) {
            context.read<QuestionCubit>().stopExamTimer();
            Navigator.pushReplacementNamed(
              context,
              AppRoutesName.examScore,
              arguments: ExamScoreArgs(
                questionCubit: context.read<QuestionCubit>(),
                examScoreModel: state.checkQuestionState.data!,
                examId: state.examId,
              ),
            );
          }
        },
        builder: (context, state) {
          final questionCubit = context.read<QuestionCubit>();
          final questions = state.questionState.data?.questions ?? [];
          final hasQuestions = questions.isNotEmpty;
          final currentIndex = state.currentQuestionIndex;
          final currentQuestion =
              hasQuestions ? questions[currentIndex] : null;
          final isTimerInWarningState = questionCubit.isTimerInWarningState();
          final formattedRemainingTime = questionCubit.formattedRemainingTime();
          final isAnswered = questionCubit.isAnswered(currentIndex);
          final isSubmitting = state.checkQuestionState.isLoading;

          return Scaffold(
            appBar: AppBar(
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(AppStrings.examTitle),
              ),
              leading:
                  SvgPicture.asset(Assets.assetsIconsArrowBack, height: 20),
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
              child: Skeletonizer(
                enabled: state.questionState.isLoading,
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
                        value:
                            hasQuestions ? (currentIndex + 1) / questions.length : 0,
                        backgroundColor: AppColors.grey,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 80,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            currentQuestion?.question ?? "No questions available.",
                            style: TextStyles.bodyMedium18,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      if (currentQuestion != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            currentQuestion.type == 'multiple_choice'
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
                          height: 270,
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
                              onPressed:
                                  (!hasQuestions || currentIndex == 0 || isSubmitting)
                                      ? null
                                      : () {
                                          questionCubit.previousQuestion();
                                        },
                              child: const Text("back"),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: FilledButton(
                              onPressed: (!hasQuestions || !isAnswered || isSubmitting)
                                  ? null
                                  : () {
                                      if (currentIndex < questions.length - 1) {
                                        questionCubit.nextQuestion();
                                      } else {
                                        questionCubit.doQuestionEvent(
                                          CheckQuestionsUseCase(),
                                        );
                                      }
                                    },
                              child: isSubmitting
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      currentIndex == questions.length - 1
                                          ? "Submit"
                                          : "Next",
                                    ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
