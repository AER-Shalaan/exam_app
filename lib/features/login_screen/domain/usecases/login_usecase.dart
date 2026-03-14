import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/data/datasources/Remote/login_remote_datasource_contract.dart';
import 'package:exam_app/features/auth/data/models/get_user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserusecase {
  final LoginRemoteDatasourceContract _repository;

  GetUserusecase(this._repository);
  Future<BaseResponse<UserModel>> call() => _repository.getUsers(body: {});
}
