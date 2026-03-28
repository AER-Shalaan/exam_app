import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/api/api_client/question_api_client.dart';
import 'package:exam_app/features/question/api/request/post_add_question_request.dart';
import 'package:exam_app/features/question/data/datasources_contract/question_datasource_contract.dart';
import 'package:exam_app/features/question/data/models/answer_model.dart';
import 'package:exam_app/features/question/data/models/questions/questions_model.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: QuestionDataSourceContract)
class QuestionsDataSourceImpl implements QuestionDataSourceContract {
  final QuestionApiClient apiClient;

  QuestionsDataSourceImpl(this.apiClient);

  @override
  Future<BaseResponse<QuestionsModel>> getAllQuestions(String token) {
    // TODO: implement getAllQuestions
    throw UnimplementedError();
  }
  
  @override
  Future<BaseResponse<QuestionsModel>> getQuestionsOnExam(String token, String examId) {
    // TODO: implement getQuestionsOnExam
    throw UnimplementedError();
  }
  
  @override
  Future<BaseResponse<QuestionsModel>> getSingleQuestion(String token) {
    // TODO: implement getSingleQuestion
    throw UnimplementedError();
  }
  
  @override
  Future<BaseResponse<QuestionsModel>> getUserHistory(String token) {
    // TODO: implement getUserHistory
    throw UnimplementedError();
  }
  
  @override
  Future<BaseResponse<QuestionsModel>> postAddQuestion(postAddQuestionRequest addquestionrequest, String token) {
    // TODO: implement postAddQuestion
    throw UnimplementedError();
  }
  
  @override
  Future<BaseResponse<QuestionsModel>> postChechQuestion(AnswerModel answermodel, String token) {
    // TODO: implement postChechQuestion
    throw UnimplementedError();
  }



}
