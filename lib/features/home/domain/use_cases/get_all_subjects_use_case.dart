import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/home/domain/entities/get_all_subjects_entity.dart';
import 'package:exam_app/features/home/domain/repositories_contract/home_repositories_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllSubjectsUseCase {
  final HomeRepositoriesContract homeRepositoriesContract;
  GetAllSubjectsUseCase(this.homeRepositoriesContract);
  Future<BaseResponse<GetAllSubjectsEntity>> execute({required String token}) =>
      homeRepositoriesContract.getAllSubjects(token: token);
}
