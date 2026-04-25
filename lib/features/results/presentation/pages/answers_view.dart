import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/domain/entities/question_attempt_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnswersView extends StatelessWidget {
  final ExamAttemptEntity attempt;

  const AnswersView({super.key, required this.attempt});

  @override
  Widget build(BuildContext context) {
    final questions = attempt.questions ?? [];

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(Assets.assetsIconsArrowBack),
          ),
        ),
        title: Text(AppStrings.answers, style: TextStyles.bodyMedium20),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: questions.length,
        separatorBuilder: (_, _) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return _QuestionAnswerCard(question: questions[index]);
        },
      ),
    );
  }
}

class _QuestionAnswerCard extends StatelessWidget {
  final QuestionAttemptEntity question;

  const _QuestionAnswerCard({required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.baseBlack10,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.question ?? '', style: TextStyles.bodyMedium16),
          const SizedBox(height: 12),
          ...(question.answers ?? []).map(
            (answer) => _AnswerOption(
              answer: answer,
              isCorrect: answer == question.correctAnswer,
              isSelected: answer == question.selectedAnswer,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnswerOption extends StatelessWidget {
  final String answer;
  final bool isCorrect;
  final bool isSelected;

  const _AnswerOption({
    required this.answer,
    required this.isCorrect,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isWrongSelected = isSelected && !isCorrect;

    Color bgColor = AppColors.lightBlue;
    Color borderColor = Colors.transparent;
    Widget leadingIcon = _buildRadioButton(isCorrect: false, isWrong: false);

    if (isCorrect) {
      bgColor = AppColors.successColor.withValues(alpha: 0.15);
      borderColor = AppColors.successColor;
      leadingIcon = _buildRadioButton(isCorrect: true, isWrong: false);
    } else if (isWrongSelected) {
      bgColor = AppColors.errorColor.withValues(alpha: 0.15);
      borderColor = AppColors.errorColor;
      leadingIcon = _buildRadioButton(isCorrect: false, isWrong: true);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          leadingIcon,
          const SizedBox(width: 12),
          Expanded(child: Text(answer, style: TextStyles.bodyMedium16)),
        ],
      ),
    );
  }

  Widget _buildRadioButton({required bool isCorrect, required bool isWrong}) {
    if (isCorrect) {
      return SvgPicture.asset(
        Assets.assetsIconsSelectedIcon,
        height: 35,
        colorFilter: ColorFilter.mode(AppColors.successColor, BlendMode.srcIn),
      );
    } else if (isWrong) {
      return SvgPicture.asset(
        Assets.assetsIconsSelectedIcon,
        height: 35,
        colorFilter: ColorFilter.mode(AppColors.errorColor, BlendMode.srcIn),
      );
    } else {
      return SvgPicture.asset(Assets.assetsIconsUnselectedIcon, height: 35);
    }
  }
}
