import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/question/data/datasources_contract/question_datasource_contract.dart';
import 'package:exam_app/features/question/data/mappers/questions/response/question_response_mapper.dart';
import 'package:exam_app/features/question/data/models/questions/responce/question_response.dart';
import 'package:exam_app/features/question/domain/entities/questions/responce_entity/question_response_entity.dart';
import 'package:exam_app/features/question/domain/repositories_contract/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionRepoContract)
class QuestionsRepoImpl implements QuestionRepoContract {
  final QuestionDataSourceContract questionDataSourceContract;
  QuestionsRepoImpl({required this.questionDataSourceContract});

  @override
  Future<BaseResponse<QuestionResponseEntity>> getQuestionsOnExam(
      {required String examId}) async {
    final response =
        await questionDataSourceContract.getQuestionsOnExam(examId: examId);

    switch (response) {
      case SuccessBaseResponse<QuestionsResponse>():
        final data = response.data.responseToEntity();
        return SuccessBaseResponse<QuestionResponseEntity>(data: data);
      case ErrorBaseResponse<QuestionsResponse>():
        return ErrorBaseResponse<QuestionResponseEntity>(
          exception: response.exception,
        );
    }
  }

  // @override
  // Future<BaseResponse<CheckQuestionsResponseEntity>> checkQuestions({
  //   required QuestionRequest checkQuestionRequest,
  // }) async {
  //   final response = await questionDataSourceContract.checkQuestions(
  //     checkQuestionRequest: checkQuestionRequest,
  //   );

  //   switch (response) {
  //     case SuccessBaseResponse<CheckQuestionsResponse>():
  //       final data = response.data.responseToEntity();
  //       return SuccessBaseResponse<CheckQuestionsResponseEntity>(
  //         data: data,
  //       );

  //     case ErrorBaseResponse<CheckQuestionsResponse>():
  //       return ErrorBaseResponse<CheckQuestionsResponseEntity>(
  //         exception: response.exception,
  //       );
  //   }
  // }
}
