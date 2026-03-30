import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/home/data/data_sources_contract/home_data_sources_contract.dart';
import 'package:exam_app/features/home/data/models/get_all_subjects_response.dart';
import 'package:exam_app/features/home/domain/entities/get_all_subjects_entity.dart';
import 'package:exam_app/features/home/domain/repositories_contract/home_repositories_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepositoriesContract)
class HomeRepositoriesImpl implements HomeRepositoriesContract {
  HomeRepositoriesImpl(this.homeDataSourcesContract);

  final HomeDataSourcesContract homeDataSourcesContract;
  @override
  Future<BaseResponse<GetAllSubjectsEntity>> getAllSubjects({
    required String token,
  }) async {
    final response = await homeDataSourcesContract.getAllSubjects(token: token);
    switch (response) {
      case SuccessBaseResponse<GetAllSubjectsResponse>():
        final data = response.data.toDomain();
        return SuccessBaseResponse<GetAllSubjectsEntity>(data: data);
      case ErrorBaseResponse<GetAllSubjectsResponse>():
        return ErrorBaseResponse<GetAllSubjectsEntity>(
          exception: response.exception,
        );
    }
  }
}
