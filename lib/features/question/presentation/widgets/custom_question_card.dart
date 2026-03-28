import 'package:exam_app/features/question/presentation/widgets/1.dart';
import 'package:flutter/material.dart';

class CustomQuestionCard extends StatelessWidget {
const  CustomQuestionCard({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Extractquestioncard(),
        SizedBox(height: 10),
        Extractquestioncard(),
        SizedBox(height: 10),
        Extractquestioncard(),
        SizedBox(height: 10),
        Extractquestioncard(),
      ],
    );
  }
}
