import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_entity/questions_model_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExamQuestionsCardDetalis extends StatelessWidget {
  final QuestionModelEntity questionModel;

  const ExamQuestionsCardDetalis({
    super.key,
    required this.questionModel,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        // color: questionModel.isSelected
        //     ? AppColors.primary10
        //     : AppColors.lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // questionModel.isSelected = !questionModel.isSelected;
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // questionModel.isSelected
                // ? SvgPicture.asset(
                //     Assets.assetsIconsSelected,
                //     width: 40,
                //     height: 40,
                //   )
                // :
                SvgPicture.asset(
                  Assets.assetsIconsUnSelected,
                  width: 40,
                  height: 40,
                ),
                Text(
                  questionModel.question,
                  style: TextStyles.bodyMedium16,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
