import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/home/api/api_client/home_api_client.dart';
import 'package:exam_app/features/home/data/data_sources_contract/home_data_sources_contract.dart';
import 'package:exam_app/features/home/data/models/get_all_subjects_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSourcesContract)
class HomeDataSourcesImpl implements HomeDataSourcesContract {
  HomeDataSourcesImpl(this.homeApiClient);
  final HomeApiClient homeApiClient;
  @override
  Future<BaseResponse<GetAllSubjectsResponse>> getAllSubjects({
    required String token,
  }) async {
    try {
      final response = await homeApiClient.getAllSubjects(token);
      return SuccessBaseResponse<GetAllSubjectsResponse>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<GetAllSubjectsResponse>(exception: e);
    }
  }
}
