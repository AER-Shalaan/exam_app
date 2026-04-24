import 'package:exam_app/features/question/domain/entities/check_questions/check_questions_response/check_question_response_entity.dart';
import 'package:exam_app/features/question/presentation/cubit/question_cubit.dart';

class ExamScoreArgs {
  final QuestionCubit questionCubit;
  final CheckQuestionsResponseEntity examScoreModel;
  final String examId;

  const ExamScoreArgs({
    required this.questionCubit,
    required this.examScoreModel,
    required this.examId,
  });
}
