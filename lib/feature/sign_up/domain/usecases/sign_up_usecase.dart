import 'package:exam_app/feature/sign_up/data/datasources/sign_up_datasource_contract.dart';
import 'package:exam_app/feature/sign_up/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class setUserusecase {
  final SignUpDataSourceContract _repository;

  setUserusecase(this._repository);
  Future<List<UserModel>> call() => _repository.setUsers();
}
