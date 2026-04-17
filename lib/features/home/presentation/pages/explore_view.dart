import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/home/presentation/cubit/home_events.dart';
import 'package:exam_app/features/home/presentation/cubit/home_view_model.dart';
import 'package:exam_app/features/home/presentation/widgets/search_field.dart';
import 'package:exam_app/features/home/presentation/widgets/subjects_list_view.dart';
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
        SubjectsListView(),
      ],
    );
  }
}
