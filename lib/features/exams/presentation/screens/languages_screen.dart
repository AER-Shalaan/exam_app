import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/config/app_routes.dart';
import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/features/exams/presentation/cubit/exams_events.dart';
import 'package:exam_app/features/exams/presentation/cubit/exams_states.dart';
import 'package:exam_app/features/exams/presentation/cubit/exams_view_model.dart';
import 'package:exam_app/features/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    String? subjectId;
    if (args is String) {
      subjectId = args;
    } else if (args is Map) {
      subjectId = args['id']?.toString() ?? args['subjectId']?.toString();
    }

    return BlocProvider(
      create: (context) =>
          getIt<ExamsViewModel>()..add(GetExamsEvent(subjectId: subjectId)),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.baseBlack),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Exams',
            style: TextStyle(
              color: AppColors.baseBlack,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<ExamsViewModel, ExamsStates>(
          builder: (context, state) {
            if (state is ExamsLoadingState || state is ExamsInitialState) {
              return Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Gap(12),
                  itemBuilder: (context, index) {
                    return _buildExamCard(
                      context,
                      ExamEntity(
                        title: 'Placeholder Exam Title Here',
                        duration: 45,
                        numberOfQuestions: 30,
                      ),
                    );
                  },
                ),
              );
            } else if (state is ExamsErrorState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is ExamsSuccessState) {
              final exams = state.response.exams ?? [];
              if (exams.isEmpty) {
                return const Center(child: Text('No exams available'));
              }
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: exams.length,
                separatorBuilder: (context, index) => const Gap(12),
                itemBuilder: (context, index) {
                  return _buildExamCard(context, exams[index]);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildExamCard(BuildContext context, ExamEntity exam) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.startExamScreenRouteName,
          arguments: exam.id,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.assetsImagesProfit,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        exam.title ?? 'Exam Title',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.baseBlack,
                        ),
                      ),
                      Text(
                        '${exam.duration ?? 0} Minutes',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const Gap(4),
                  Text(
                    '${exam.numberOfQuestions ?? 0} Questions',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Text(
                        'From: ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const Text(
                        '1.00',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(16),
                      Text(
                        'To: ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const Text(
                        '6.00',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
