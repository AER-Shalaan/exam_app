import 'package:exam_app/core/enums/home_tab.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/home/presentation/cubit/home_events.dart';
import 'package:exam_app/features/home/presentation/cubit/home_states.dart';
import 'package:exam_app/features/home/presentation/cubit/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      buildWhen: (previous, current) =>
          previous.currentTab != current.currentTab,
      builder: (context, state) {
        final cubit = context.read<HomeViewModel>();

        return Container(
          height: 70,
          margin: const EdgeInsets.only(bottom: 8),
          color: AppColors.lightBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Assets.assetsIconsHome,
                label: AppStrings.explore,
                isSelected: state.currentTab == HomeTab.explore,
                onTap: () =>
                    cubit.doEvent(ChangeNavBarTabHomeEvent(HomeTab.explore)),
              ),
              _NavItem(
                icon: Assets.assetsIconsCarbonResult,
                label: AppStrings.result,
                isSelected: state.currentTab == HomeTab.result,
                onTap: () =>
                    cubit.doEvent(ChangeNavBarTabHomeEvent(HomeTab.result)),
              ),
              _NavItem(
                icon: Assets.assetsIconsPerson,
                label: AppStrings.profile,
                isSelected: state.currentTab == HomeTab.profile,
                onTap: () =>
                    cubit.doEvent(ChangeNavBarTabHomeEvent(HomeTab.profile)),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isSelected,
      label: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: SizedBox(
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 32,
                  width: 64,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary10
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(label, style: TextStyles.navBarTitleStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
