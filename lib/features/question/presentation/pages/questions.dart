import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/data/models/questions/questions_model.dart';
import 'package:exam_app/features/question/presentation/widgets/exam_questions_card.dart';
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
  final List<QuestionsModel> questionModel = [
    QuestionsModel(
      question: "The first sentence is co",
      isSelected: true,
      dateTime: " 10:00",
    ),
    QuestionsModel(
      question: "The first sentence is false.",
      isSelected: true,
      dateTime: " 12:00",
    ),
    QuestionsModel(
      question: "The first sentence is semi.",
      isSelected: true,
      dateTime: " 11:00",
    ),
    QuestionsModel(
      question: "The first sentence is true.",
      isSelected: true,
      dateTime: " 1:00",
    ),
  ];
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
            questionModel[currentIndex].dateTime,
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
                "question ${currentIndex + 1} of ${questionModel.length}",
                style: TextStyles.bodyMedium16,
                textAlign: TextAlign.center,
              ),
              LinearProgressIndicator(
                value: (currentIndex + 1) / questionModel.length,
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
                  itemCount: questionModel.length,
                  itemBuilder: (context, index) =>
                      ExamQuestionsCard(questionModel: questionModel[index]),
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
                        if (currentIndex < questionModel.length - 1) {
                          setState(() {
                            ++currentIndex;
                          });
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.examScoreRouteName,
                          );
                        }
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
