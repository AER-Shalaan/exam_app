import 'package:exam_app/features/question/data/models/questions/question_response.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_entity/questions_model_entity.dart';
import 'package:exam_app/features/question/presentation/widgets/exam_question_detalis.dart';
import 'package:flutter/material.dart';

class ExamQuestionsCard extends StatelessWidget {
  const ExamQuestionsCard({
    super.key,
    required this.questionModel,
    required this.onAnswerSelected,
  });
  final QuestionModelEntity questionModel;
  final ValueChanged<CorrectModel> onAnswerSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: questionModel.answers
          .map(
            (answer) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ExamQuestionsCardDetalis(
                answerModel: answer,
                isSelected: questionModel.selectedAnswerKeys.contains(answer.key),
                onTap: () => onAnswerSelected(answer.key),
              ),
            ),
          )
          .toList(),
    );
  }
}
