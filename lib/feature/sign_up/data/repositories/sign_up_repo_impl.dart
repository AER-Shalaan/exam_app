import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/feature/sign_up/data/datasources/remote/sign_up_remote_datasource_contract.dart';
import 'package:exam_app/feature/sign_up/data/mappers/sign_up_mappers.dart';
import 'package:exam_app/feature/sign_up/data/models/user_model.dart';
import 'package:exam_app/feature/sign_up/domain/entities/sign_up_entitiies.dart';
import 'package:exam_app/feature/sign_up/domain/repositories/sign_up_repo_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SignUpRepoContract)
class SignUpRepoImpl implements SignUpRepoContract {
  final SignUpRemoteDatasourceContract _signUpDataSourceContract;

  SignUpRepoImpl(this._signUpDataSourceContract);

  @override
  Future<BaseResponse<SignUpEntitiies>> setUsers({
    required Map<String, dynamic> body,
  }) {
    final response = _signUpDataSourceContract.setUsers(body: body);

    return response.then((value) {
      switch (value) {
        case SuccessBaseResponse<UserModel>():
          return SuccessBaseResponse<SignUpEntitiies>(
            data: value.data.toEntity(),
          );

        case ErrorBaseResponse<UserModel>():
          return ErrorBaseResponse<SignUpEntitiies>(
            exception: value.exception,
          );
      }
    });
  }
}
