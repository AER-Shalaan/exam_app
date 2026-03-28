import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Extractquestioncard extends StatefulWidget {
  const Extractquestioncard({super.key});

  @override
  State<Extractquestioncard> createState() => _ExtractquestioncardState();
}

class _ExtractquestioncardState extends State<Extractquestioncard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary10 : AppColors.lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          GestureDetector(
            onTap: () => setState(() {
              isSelected = !isSelected;
            }),
            child: Row(
              crossAxisAlignment: .center,
              children: [
                isSelected
                    ? SvgPicture.asset(
                        Assets.assetsIconsSelected,
                        width: 40,
                        height: 40,
                      )
                    : SvgPicture.asset(
                        Assets.assetsIconsUnSelected,
                        width: 40,
                        height: 40,
                      ),
                Text(
                  "Its going to rain today.",
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
