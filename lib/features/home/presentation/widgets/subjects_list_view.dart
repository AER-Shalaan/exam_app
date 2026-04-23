import 'package:exam_app/core/values/app_routes_name.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/exams/presentation/args/exams_args.dart';
import 'package:exam_app/features/home/presentation/cubit/home_states.dart';
import 'package:exam_app/features/home/presentation/cubit/home_view_model.dart';
import 'package:exam_app/features/home/presentation/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsListView extends StatelessWidget {
  const SubjectsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeViewModel, HomeStates>(
        buildWhen: (previous, current) {
          return previous.subjectState != current.subjectState ||
              previous.searchQuery != current.searchQuery;
        },
        builder: (context, state) {
          final subjectState = state.subjectState;
          final subjects = subjectState.data?.subjects ?? [];
          final query = state.searchQuery;

          final filteredSubjects = subjects.where((subject) {
            return subject.name.toLowerCase().contains(query.toLowerCase());
          }).toList();

          if (subjectState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (subjectState.errorMessage != null &&
              subjectState.errorMessage!.isNotEmpty) {
            return Center(
              child: Text(
                subjectState.errorMessage!,
                style: TextStyles.errorText,
              ),
            );
          }

          if (filteredSubjects.isEmpty) {
            return const Center(child: Text(AppStrings.noSubjectsFound));
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: filteredSubjects.length,
            itemBuilder: (context, index) {
              final subject = filteredSubjects[index];
              return SubjectCard(
                icon: subject.icon,
                name: subject.name,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutesName.examsOnsubject,
                    arguments: ExamsArgs(
                      subjectId: subject.id,
                      subjectName: subject.name,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
