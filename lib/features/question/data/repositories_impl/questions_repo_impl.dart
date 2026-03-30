import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/data/datasources_contract/question_datasource_contract.dart';
import 'package:exam_app/features/question/data/mappers/response/question_response_mapper.dart';
import 'package:exam_app/features/question/data/models/responce/question_response.dart';
import 'package:exam_app/features/question/domain/entities/responce/question_response_entity.dart';
import 'package:exam_app/features/question/domain/repositories_contract/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionRepoContract)
class QuestionsRepoImpl implements QuestionRepoContract {
  final QuestionDataSourceContract questionDataSourceContract;
  QuestionsRepoImpl({required this.questionDataSourceContract});

  @override
  Future<BaseResponse<QuestionResponseEntity>> getQuestionsOnExam(
      String token, String examId) async {
    final response =
        await questionDataSourceContract.getQuestionsOnExam(token, examId);

    switch (response) {
      case SuccessBaseResponse<QuestionResponse>():
        final data = response.data.responseToEntity();
        return SuccessBaseResponse<QuestionResponseEntity>(data: data);
      case ErrorBaseResponse<QuestionResponse>():
        return ErrorBaseResponse<QuestionResponseEntity>(
          exception: response.exception,
        );
    }
  }
}
