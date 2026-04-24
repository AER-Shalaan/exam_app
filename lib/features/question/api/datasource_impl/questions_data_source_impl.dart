import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/api/api_client/question_api_client.dart';
import 'package:exam_app/features/question/data/datasources_contract/question_datasource_contract.dart';
import 'package:exam_app/features/question/data/models/check_questions/request/question_request.dart';
import 'package:exam_app/features/question/data/models/check_questions/response/check_questions_response.dart';
import 'package:exam_app/features/question/data/models/questions/question_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionDataSourceContract)
class QuestionsDataSourceImpl implements QuestionDataSourceContract {
  final QuestionApiClient apiClient;

  QuestionsDataSourceImpl(this.apiClient);
  @override
  Future<BaseResponse<QuestionsResponse>> getQuestionsOnExam(
      {required String examId}) async {
    try {
      final response = await apiClient.getAllQuestiononExam(examId);
      return SuccessBaseResponse<QuestionsResponse>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<QuestionsResponse>(exception: e);
    }
  }

  @override
  Future<BaseResponse<CheckQuestionsResponse>> checkQuestions(
      {required QuestionRequest checkQuestionRequest}) async {
    try {
      final response =
          await apiClient.checkQuestions(checkQuestionRequest.toJson());
      return SuccessBaseResponse<CheckQuestionsResponse>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<CheckQuestionsResponse>(exception: e);
    }
  }
}
