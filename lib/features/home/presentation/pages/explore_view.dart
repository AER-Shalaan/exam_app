import 'package:exam_app/config/app_routes.dart';
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
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;
      final viewModel = context.read<HomeViewModel>();

      viewModel.doEvent(SearchForSubject(''));

      if (viewModel.state.subjectState.data == null) {
        viewModel.doEvent(GetSubjects());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
              controller: _controller,
              onChanged: (value) {
                context.read<HomeViewModel>().doEvent(SearchForSubject(value));
              },
            ),
            const SizedBox(height: 40),
            Text(AppStrings.browseBySubject, style: TextStyles.bodyMedium18),
            const SizedBox(height: 24),
          ],
        ),

        Expanded(
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
                return const Center(child: Text("No subjects found"));
              }

              return ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: filteredSubjects.length,
                itemBuilder: (context, index) {
                  final subject = filteredSubjects[index];
                  return SubjectCard(
                    icon: subject.icon,
                    name: subject.name,
                    onTap: () {
                      // TODO: navigate to subject details
                      //Navigator.of(context).pushNamed(AppRoutes.examOnSubjectView, arguments: subject.id);
                      // replace with fixed subject id for testing
                      //Navigator.of(context).pushNamed(AppRoutes.examOnSubjectView, arguments: "670037f6728c92b7fdf434fc");
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
