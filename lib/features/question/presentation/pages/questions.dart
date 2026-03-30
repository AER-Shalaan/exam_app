import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';
import 'package:exam_app/features/question/presentation/cubit/question_cubit.dart';
import 'package:exam_app/features/question/presentation/cubit/question_event.dart';
import 'package:exam_app/features/question/presentation/widgets/exam_questions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final questionGetIt = getIt.get<QuestionCubit>();
  int currentIndex = 0;
  final PageController _pageController = PageController();
  List<QuestionModelEntity> questionModel = [];

  @override
  void initState() {
    super.initState();
    questionGetIt.doQuestionEvent(
      QuestionsUseCase(
        examId: "670070a830a3c3c1944a9c63",
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5YzMxYTc4Y2ViMmM1OWY4NGEzZTgxNCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc0MzkzOTc2fQ.MDrScrZMqTJRUaWkB99hiQJQ94PCmhetTstWeRKI6bo",
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasQuestions = questionModel.isNotEmpty;
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
            hasQuestions
                ? questionModel[currentIndex].createdAt.toString()
                : '20:00',
            style: TextStyles.appBarTextStyle.copyWith(
              color: AppColors.successColor,
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => questionGetIt,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: BlocConsumer<QuestionCubit, QuestionState>(
              listener: (context, state) {
                final questionData = state.questionState.data;
                if (questionData != null) {
                  setState(() {
                    questionModel = questionData.questions;
                    if (currentIndex >= questionModel.length) {
                      currentIndex = 0;
                    }
                  });
                }
                if (state.questionState.errorMessage != null &&
                    state.questionState.errorMessage!.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.questionState.errorMessage!)),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      hasQuestions
                          ? "question ${currentIndex + 1} of ${questionModel.length}"
                          : "question 0 of 0",
                      style: TextStyles.bodyMedium16,
                      textAlign: TextAlign.center,
                    ),
                    LinearProgressIndicator(
                      value: hasQuestions
                          ? (currentIndex + 1) / questionModel.length
                          : 0,
                      backgroundColor: AppColors.grey,
                    ),
                    SizedBox(height: 20),
                    Text(
                      hasQuestions
                          ? questionModel[currentIndex].question
                          : "No questions available.",
                      style: TextStyles.bodyMedium18,
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 256,
                      child: PageView.builder(
                        itemCount: questionModel.length,
                        itemBuilder: (context, index) => ExamQuestionsCard(
                          questionModel: questionModel[index],
                        ),
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
                              if (!hasQuestions) return;
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
                              if (!hasQuestions) return;
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
