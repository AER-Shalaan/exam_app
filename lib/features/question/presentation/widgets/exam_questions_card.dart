import 'package:exam_app/features/question/presentation/widgets/exam_question_detalis.dart';
import 'package:flutter/material.dart';

class ExamQuestionsCard extends StatelessWidget {
  const ExamQuestionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExamQuestionDetalis(),
        SizedBox(height: 10),
        ExamQuestionDetalis(),
        SizedBox(height: 10),
        ExamQuestionDetalis(),
        SizedBox(height: 10),
        ExamQuestionDetalis(),
      ],
    );
  }
}
