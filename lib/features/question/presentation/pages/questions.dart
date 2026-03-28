import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/presentation/widgets/custom_question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: const Text(AppStrings.examTitle),
        ),
        leading: SvgPicture.asset(Assets.assetsIconsArrowBack, height: 20),
        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
        actions: [
          SvgPicture.asset(Assets.assetsImagesClock, height: 30, width: 24),
          Text(
            "30:00",
            style: TextStyles.appBarTextStyle.copyWith(
              color: AppColors.successColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "question ${currentIndex + 1} of 20",
                style: TextStyles.bodyMedium16,
                textAlign: TextAlign.center,
              ),
              LinearProgressIndicator(
                value: (currentIndex + 1) / 20,
                backgroundColor: AppColors.grey,
              ),
              SizedBox(height: 20),
              Text(
                "Select the correctly punctuated sentence.",
                style: TextStyles.bodyMedium18,
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 256,
                child: PageView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => CustomQuestionCard(),
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                ),
              ),
              SizedBox(height: 80),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        if (currentIndex > 0) {
                          setState(() {
                            --currentIndex;
                          });
                        }
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text("back"),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        if (currentIndex < 19) {
                          setState(() {
                            ++currentIndex;
                          });
                        }
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },

                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("next"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
