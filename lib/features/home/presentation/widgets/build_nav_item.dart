import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildNavItem({
  required String icon,
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {

  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 32,
          width: 64,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary10 : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
          ),
        ),

        const SizedBox(height: 4),
        Text(label, style: TextStyles.navBarTitleStyle),
      ],
    ),
  );
}
