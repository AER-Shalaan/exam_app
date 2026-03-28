import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Extractquestioncard extends StatelessWidget {
  const Extractquestioncard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: AppColors.primary10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Row(
            crossAxisAlignment: .center,
            children: [
              SvgPicture.asset(
                Assets.assetsIconsUnSelected,
                width: 40,
                height: 40,
              ),
              Text("Its going to rain today.", style: TextStyles.bodyMedium16),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
