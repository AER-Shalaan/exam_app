import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/api/api_client/question_api_client.dart';
import 'package:exam_app/features/question/data/datasources_contract/question_datasource_contract.dart';
import 'package:exam_app/features/question/data/models/responce/question_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionDataSourceContract)
class QuestionsDataSourceImpl implements QuestionDataSourceContract {
  final QuestionApiClient apiClient;

  QuestionsDataSourceImpl(this.apiClient);
  @override
  Future<BaseResponse<List<QuestionResponse>>> getQuestionsOnExam(
      String token, String examId) async {
    try {
      final response = await apiClient.getAllQuestiononExam(token, examId);
      return SuccessBaseResponse<List<QuestionResponse>>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<List<QuestionResponse>>(exception: e);
    }
    // }
    // @override
    // Future<BaseResponse<QuestionModel>> getAllQuestions(String token) {
    //   // TODO: implement getAllQuestions
    //   throw UnimplementedError();
    // }

    // @override
    // Future<BaseResponse<QuestionModel>> getSingleQuestion(String token) {
    //   // TODO: implement getSingleQuestion
    //   throw UnimplementedError();
    // }

    // @override
    // Future<BaseResponse<QuestionModel>> getUserHistory(String token) {
    //   // TODO: implement getUserHistory
    //   throw UnimplementedError();
    // }

    // @override
    // Future<BaseResponse<QuestionModel>> postAddQuestion(
    //     postAddQuestionRequest addquestionrequest, String token) {
    //   // TODO: implement postAddQuestion
    //   throw UnimplementedError();
    // }

    // @override
    // Future<BaseResponse<QuestionModel>> postChechQuestion(
    //     AnswerModel answermodel, String token) {
    //   // TODO: implement postChechQuestion
    //   throw UnimplementedError();
  }
}
