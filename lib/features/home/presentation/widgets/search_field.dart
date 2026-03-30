import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset(
            Assets.assetsIconsSearch,
            colorFilter: ColorFilter.mode(
              AppColors.baseBlack30,
              BlendMode.srcIn,
            ),
          ),
        ),
        hintText: AppStrings.search,
        enabledBorder:
            (Theme.of(context).inputDecorationTheme.enabledBorder
                    as OutlineInputBorder)
                .copyWith(borderRadius: BorderRadius.circular(20)),
        focusedBorder:
            (Theme.of(context).inputDecorationTheme.focusedBorder
                    as OutlineInputBorder)
                .copyWith(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
