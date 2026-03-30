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
  Future<BaseResponse<QuestionResponse>> getQuestionsOnExam(
      String token, String examId) async {
    try {
    
      final response = await apiClient.getAllQuestiononExam(token, examId);
      return SuccessBaseResponse<QuestionResponse>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<QuestionResponse>(exception: e);
    }
  }
}
