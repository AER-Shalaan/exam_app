import 'package:exam_app/features/question/api/request/post_add_question_request.dart';
import 'package:exam_app/features/question/data/datasources_contract/question_datasource_contract.dart';
import 'package:exam_app/features/question/data/models/answer_model.dart';
import 'package:exam_app/features/question/domain/repositories_contract/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionRepoContract)
class QuestionsRepoImpl implements QuestionRepoContract {
  final QuestionDataSourceContract questionDataSourceContract;
  QuestionsRepoImpl({required this.questionDataSourceContract});

  @override
  Future<void> getQuestions() {
    // TODO: implement getQuestions
    throw UnimplementedError();
  }

  @override
  Future<void> getQuestionsOnExam(String token, String examId) {
    // TODO: implement getQuestionsOnExam
    throw UnimplementedError();
  }

  @override
  Future<void> getSingleQuestion(String token) {
    // TODO: implement getSingleQuestion
    throw UnimplementedError();
  }

  @override
  Future<void> getUserHistory(String token) {
    // TODO: implement getUserHistory
    throw UnimplementedError();
  }

  @override
  Future<void> postAddQuestion(postAddQuestionRequest addquestionrequest, String token) {
    // TODO: implement postAddQuestion
    throw UnimplementedError();
  }

  @override
  Future<void> postChechQuestion(AnswerModel answermodel, String token) {
    // TODO: implement postChechQuestion
    throw UnimplementedError();
  }

}
