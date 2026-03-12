import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/feature/sign_up/data/datasources/remote/sign_up_remote_datasource_contract.dart';
import 'package:exam_app/feature/sign_up/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetUserusecase {
  final SignUpRemoteDatasourceContract _repository;

  SetUserusecase(this._repository);
  Future<BaseResponse<UserModel>> call() => _repository.setUsers(body: {});
}
