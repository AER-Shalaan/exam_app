import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/features/exams/presentation/cubit/exams_states.dart';
import 'package:exam_app/features/exams/presentation/cubit/exams_view_model.dart';
import 'package:exam_app/features/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/exams/presentation/widgets/exam_card_widget.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubjectExamsScreen extends StatelessWidget {
  final String? subjectId;

  const SubjectExamsScreen({super.key, this.subjectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.baseBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          AppStrings.exams,
          style: TextStyle(
            color: AppColors.baseBlack,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<ExamsViewModel, ExamsStates>(
        builder: (context, state) {
          switch (state) {
            case ExamsLoadingState():
            case ExamsInitialState():
              return Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Gap(12),
                  itemBuilder: (context, index) {
                    return const ExamCardWidget(
                      isInteractive: false,
                      exam: ExamEntity(
                        title: AppStrings.placeholderExamTitle,
                        duration: 45,
                        numberOfQuestions: 30,
                      ),
                    );
                  },
                ),
              );
            case ExamsErrorState():
              return Center(child: Text(state.errorMessage));
            case ExamsSuccessState():
              final exams = state.response.exams ?? [];
              if (exams.isEmpty) {
                return const Center(child: Text(AppStrings.noExamsAvailable));
              }
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: exams.length,
                separatorBuilder: (context, index) => const Gap(12),
                itemBuilder: (context, index) {
                  return ExamCardWidget(exam: exams[index]);
                },
              );
          }
        },
      )
    );
  }
}

