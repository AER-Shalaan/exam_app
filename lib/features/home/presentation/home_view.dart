import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/auth/token_manager.dart';
import 'package:exam_app/core/enums/home_tab.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/home/presentation/cubit/home_events.dart';
import 'package:exam_app/features/home/presentation/cubit/home_states.dart';
import 'package:exam_app/features/home/presentation/cubit/home_view_model.dart';
import 'package:exam_app/features/home/presentation/pages/explore_view.dart';
import 'package:exam_app/features/profile/presentation/profile_view.dart';
import 'package:exam_app/features/results/presentation/pages/result_view.dart';
import 'package:exam_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  final HomeTab? initialTab;
  HomeView({super.key, this.initialTab});
  final pages = {
    HomeTab.explore: const ExploreView(),
    HomeTab.result: const ResultView(),
    HomeTab.profile: const ProfileView(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<HomeViewModel>()
            ..doEvent(ChangeNavBarTabHomeEvent(initialTab ?? HomeTab.explore)),
      child: BlocBuilder<HomeViewModel, HomeStates>(
        buildWhen: (previous, current) =>
            previous.currentTab != current.currentTab,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(switch (state.currentTab) {
                  HomeTab.explore => AppStrings.homeTitle,
                  HomeTab.result => AppStrings.result,
                  HomeTab.profile => AppStrings.profile,
                }, style: TextStyles.titleMedium20Primary),
              ),
              actions: [
                if (state.currentTab == HomeTab.profile)
                  IconButton(
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: AppColors.errorColor,
                      size: 30,
                    ),
                    onPressed: () {
                      TokenManager.clearToken();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutesName.login,
                        (route) => false,
                      );
                    },
                  ),
              ],
            ),
            bottomNavigationBar: CustomBottomNavBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: pages[state.currentTab],
            ),
          );
        },
      ),
    );
  }
}
