import 'package:exam_app/features/question/data/models/question_model/question_model.dart';
import 'package:exam_app/features/question/presentation/widgets/exam_question_detalis.dart';
import 'package:flutter/material.dart';

class ExamQuestionsCard extends StatelessWidget {
  const ExamQuestionsCard({super.key, required this.questionModel});
  final QuestionModel questionModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExamQuestionsCardDetalis(questionModel: questionModel),
        SizedBox(height: 10),
        ExamQuestionsCardDetalis(questionModel: questionModel),
        SizedBox(height: 10),
        ExamQuestionsCardDetalis(questionModel: questionModel),
        SizedBox(height: 10),
        ExamQuestionsCardDetalis(questionModel: questionModel),
      ],
    );
  }
}
