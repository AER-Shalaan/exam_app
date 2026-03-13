import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/login_screen/data/datasources/Remote/login_remote_datasource_contract.dart';
import 'package:exam_app/features/login_screen/data/models/get_user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GettUserusecase {
  final LoginRemoteDatasourceContract _repository;

  GettUserusecase(this._repository);
  Future<BaseResponse<UserModel>> call() => _repository.setUsers(body: {});
}
