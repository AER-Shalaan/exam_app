import 'package:percent_indicator/percent_indicator.dart';

class ExamScoreModel {
  final int correct;
  final int incorrect;
  final int total;
  LinearPercentIndicator? linearPercentIndicator;
  final double percent;

  ExamScoreModel({
    required this.correct,
    required this.incorrect,
    required this.total,
    this.linearPercentIndicator,
    required this.percent,
  });
}
