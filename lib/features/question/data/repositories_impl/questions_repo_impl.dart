import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/data/datasources_contract/question_datasource_contract.dart';
import 'package:exam_app/features/question/data/mappers/questions/question_model_mapper.dart';
import 'package:exam_app/features/question/data/models/responce/question_response.dart';
import 'package:exam_app/features/question/domain/entities/questions/questions_model_entity.dart';
import 'package:exam_app/features/question/domain/repositories_contract/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionRepoContract)
class QuestionsRepoImpl implements QuestionRepoContract {
  final QuestionDataSourceContract questionDataSourceContract;
  QuestionsRepoImpl({required this.questionDataSourceContract});

  @override
  Future<BaseResponse<QuestionModelEntity>> getQuestionsOnExam(
      String token, String examId) async {
    final response =
        await questionDataSourceContract.getQuestionsOnExam(token, examId);

    switch (response) {
      case SuccessBaseResponse<QuestionResponse>():
        final responses = response.data;

        final questionEntity = responses.questions.first.modelToEntity();

        return SuccessBaseResponse<QuestionModelEntity>(data: questionEntity);
      case ErrorBaseResponse<QuestionResponse>():
        return ErrorBaseResponse<QuestionModelEntity>(
          exception: response.exception,
        );
    }
  }
}
