import 'package:exam_app/core/enums/home_tab.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/features/home/presentation/cubit/home_events.dart';
import 'package:exam_app/features/home/presentation/cubit/home_states.dart';
import 'package:exam_app/features/home/presentation/cubit/home_view_model.dart';
import 'package:exam_app/features/home/presentation/widgets/build_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      builder: (context, state) {
        final cubit = context.read<HomeViewModel>();

        return Container(
          height: 70,
          margin: const EdgeInsets.only(bottom: 8),
          color: AppColors.lightBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem(
                icon: Assets.assetsIconsHome,
                label: AppStrings.explore,
                isSelected: state.currentTab == HomeTab.explore,
                onTap: () => cubit.doEvent(ChangeNavBarTab(HomeTab.explore)),
              ),
              buildNavItem(
                icon: Assets.assetsIconsCarbonResult,
                label: AppStrings.result,
                isSelected: state.currentTab == HomeTab.result,
                onTap: () => cubit.doEvent(ChangeNavBarTab(HomeTab.result)),
              ),
              buildNavItem(
                icon: Assets.assetsIconsPerson,
                label: AppStrings.profile,
                isSelected: state.currentTab == HomeTab.profile,
                onTap: () => cubit.doEvent(ChangeNavBarTab(HomeTab.profile)),
              ),
            ],
          ),
        );
      },
    );
  }
}
