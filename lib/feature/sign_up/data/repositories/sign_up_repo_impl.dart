import 'package:exam_app/feature/sign_up/data/datasources/sign_up_datasource_contract.dart';
import 'package:exam_app/feature/sign_up/data/mappers/sign_up_mappers.dart';
import 'package:exam_app/feature/sign_up/domain/entities/sign_up_entitiies.dart';
import 'package:exam_app/feature/sign_up/domain/repositories/sign_up_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepoContract)
class SignUpRepoImpl implements SignUpRepoContract {
  final SignUpDataSourceContract _signUpDataSourceContract;

  SignUpRepoImpl(this._signUpDataSourceContract);
  @override
  Future<List<SignUpEntitiies>> setUsers() {
    return _signUpDataSourceContract.setUsers().then((v) {
      return v.map((e) => e.toEntity()).toList();
    });
  }
}
