import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/home/presentation/cubit/home_events.dart';
import 'package:exam_app/features/home/presentation/cubit/home_states.dart';
import 'package:exam_app/features/home/presentation/cubit/home_view_model.dart';
import 'package:exam_app/features/home/presentation/widgets/search_field.dart';
import 'package:exam_app/features/home/presentation/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;
      context.read<HomeViewModel>().doEvent(GetSubjects());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchField(),
            const SizedBox(height: 40),
            Text(AppStrings.browseBySubject, style: TextStyles.bodyMedium18),
            const SizedBox(height: 24),
          ],
        ),

        Expanded(
          child: BlocBuilder<HomeViewModel, HomeStates>(
            builder: (context, state) {
              final subjectState = state.subjectState;
              final subjects = subjectState.data?.subjects ?? [];

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

              if (subjects.isEmpty) {
                return const Center(child: Text("No subjects found"));
              }

              return ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return SubjectCard(icon: subject.icon, name: subject.name);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
