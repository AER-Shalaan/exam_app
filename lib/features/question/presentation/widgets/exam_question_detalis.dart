import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/domain/entities/questions/answer/answer_model_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExamQuestionsCardDetalis extends StatelessWidget {
  final AnswerModelEntity answerModel;
  final bool isSelected;
  final VoidCallback onTap;

  const ExamQuestionsCardDetalis({
    super.key,
    required this.answerModel,
    required this.isSelected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary10 : AppColors.lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isSelected
                    ? SvgPicture.asset(
                        Assets.assetsIconsSelectedIcon,
                        width: 40,
                        height: 40,
                      )
                    : SvgPicture.asset(
                        Assets.assetsIconsUnselectedIcon,
                        width: 40,
                        height: 40,
                      ),
                Expanded(
                  child: Text(
                    answerModel.answer,
                    style: TextStyles.bodyMedium16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
