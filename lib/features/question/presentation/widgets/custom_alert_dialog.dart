import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/text_styles.dart';
import 'package:exam_app/features/question/presentation/cubit/question_cubit.dart';
import 'package:exam_app/features/question/presentation/cubit/question_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      icon: const Icon(
        Icons.timer_off_rounded,
        size: 48,
        color: AppColors.errorColor,
      ),
      title: Text(
        'Time is up',
        textAlign: TextAlign.center,
        style: TextStyles.bodyMedium18,
      ),
      content: Text(
        'Your exam time has ended. Go to the exam result page.',
        textAlign: TextAlign.center,
        style: TextStyles.bodyRegular13,
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<QuestionCubit>().doQuestionEvent(
                    CheckQuestionsUseCase(),
                  );
            },
            child: const Text('Show Result'),
          ),
        ),
      ],
    );
  }
}
