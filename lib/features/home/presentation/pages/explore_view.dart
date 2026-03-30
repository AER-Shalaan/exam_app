import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/home/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchField(),
        const SizedBox(height: 40),
        Text(AppStrings.browseBySubject, style: TextStyles.bodyMedium18),
        const SizedBox(height: 24),
      ],
    );
  }
}
// FilledButton(
        //   onPressed: () {
        //     TokenManager.clearToken();
        //     Navigator.pushNamedAndRemoveUntil(
        //       context,
        //       AppRoutes.loginViewRouteName,
        //       (route) => false,
        //     );
        //   },
        //   child: Text("logout"),
        // ),