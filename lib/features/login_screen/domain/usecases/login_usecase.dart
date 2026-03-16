import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/Apis/respones/login_respons.dart';
import 'package:exam_app/features/auth/data/datasources/Remote/login_remote_datasource_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserusecase {
  final LoginRemoteDatasourceContract _repository;

  GetUserusecase(this._repository);
  Future<BaseResponse<LoginRespons>> call() => _repository.getUsers(body: {});
}
