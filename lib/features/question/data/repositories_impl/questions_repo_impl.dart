import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/data/datasources_contract/question_datasource_contract.dart';
import 'package:exam_app/features/question/data/mappers/questions/question_model_mapper.dart';
import 'package:exam_app/features/question/data/mappers/response/question_response_mapper.dart';
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
      case SuccessBaseResponse<List<QuestionResponse>>():
        final responses = response.data;

        final questionEntity = responses.first.questions.first.modelToEntity()
          ..questionResponseEntity = responses.first.responseToEntity();

        return SuccessBaseResponse<QuestionModelEntity>(data: questionEntity);
      case ErrorBaseResponse<List<QuestionResponse>>():
        return ErrorBaseResponse<QuestionModelEntity>(
          exception: response.exception,
        );
    }
    // }

    // @override
    // Future<BaseResponse<void>> getQuestions() {
    //   // TODO: implement getQuestions
    //   throw UnimplementedError();
    // }

    // @override
    // Future<BaseResponse<void>> getSingleQuestion(String token) {
    //   // TODO: implement getSingleQuestion
    //   throw UnimplementedError();
    // }

    // @override
    // Future<BaseResponse<void>> getUserHistory(String token) {
    //   // TODO: implement getUserHistory
    //   throw UnimplementedError();
    // }

    // @override
    // Future<BaseResponse<void>> postAddQuestion(
    //     postAddQuestionRequest addquestionrequest, String token) {
    //   // TODO: implement postAddQuestion
    //   throw UnimplementedError();
    // }

    // @override
    // Future<BaseResponse<void>> postChechQuestion(
    //     AnswerModel answermodel, String token) {
    //   // TODO: implement postChechQuestion
    //   throw UnimplementedError();
    // }
  }
}
