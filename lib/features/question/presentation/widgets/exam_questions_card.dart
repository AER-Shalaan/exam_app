import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';
import 'package:exam_app/features/question/presentation/widgets/exam_question_detalis.dart';
import 'package:flutter/material.dart';

class ExamQuestionsCard extends StatelessWidget {
  const ExamQuestionsCard({super.key, required this.questionModel});
  final QuestionModelEntity questionModel;
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
