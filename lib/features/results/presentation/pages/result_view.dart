import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/images_paths.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/results/domain/entities/exam_attempt_entity.dart';
import 'package:exam_app/features/results/presentation/cubit/result_cubit.dart';
import 'package:exam_app/features/results/presentation/cubit/result_event.dart';
import 'package:exam_app/features/results/presentation/cubit/result_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<ResultCubit>()..doEvent(LoadResultsEvent()),
      child: BlocBuilder<ResultCubit, ResultState>(
        builder: (context, state) {
          if (state.resultsState.errorMessage != null) {
            return Center(child: Text(state.resultsState.errorMessage!));
          }

          final results = state.resultsState.data ?? [];

          if (!state.resultsState.isLoading && results.isEmpty) {
            return const Center(child: Text(AppStrings.noResultsYet));
          }

          final grouped = <String, List<ExamAttemptEntity>>{};
          for (final attempt in results) {
            final subject = attempt.subjectName ?? AppStrings.other;
            grouped.putIfAbsent(subject, () => []).add(attempt);
          }

          return Skeletonizer(
            enabled: state.resultsState.isLoading,
            child: ListView(
              children: grouped.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entry.key, style: TextStyles.bodyMedium18),
                    const SizedBox(height: 8),
                    ...entry.value.map(
                      (attempt) => _ResultCard(attempt: attempt),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final ExamAttemptEntity attempt;

  const _ResultCard({required this.attempt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.answers, arguments: attempt);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.baseBlack20,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Center(
              child: Image.asset(
                Assets.assetsImagesProfit,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        attempt.examTitle ?? '',
                        style: TextStyles.bodyMedium16,
                      ),
                      const Spacer(),
                      Text(
                        '${attempt.examDuration ?? 0} ${AppStrings.minutes}',
                        style: TextStyles.bodyRegular13,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${attempt.total ?? 0} ${AppStrings.questions}',
                    style: TextStyles.bodyRegular13grey,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.correctedAnswersIn(
                      attempt.correctCount ?? 0,
                      _formatDuration(attempt.duration),
                    ),
                    style: TextStyles.bodyRegular13.copyWith(
                      color: AppColors.primary,
                    ),
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

String _formatDuration(String? duration) {
  if (duration == null || duration.isEmpty) return '';

  final parts = duration.split(':');
  if (parts.length != 2) return duration;

  final minutes = int.tryParse(parts[0]) ?? 0;
  final seconds = int.tryParse(parts[1]) ?? 0;

  if (minutes == 0) {
    return '$seconds ${AppStrings.seconds}';
  } else {
    return '$minutes ${AppStrings.minutes}';
  }
}
