import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/login_screen/data/datasources/Remote/login_remote_datasource_contract.dart';
import 'package:exam_app/features/login_screen/data/mapper/login_mappers.dart';
import 'package:exam_app/features/login_screen/data/models/get_user_model.dart';
import 'package:exam_app/features/login_screen/domain/entities/login_entitiies.dart';
import 'package:exam_app/features/login_screen/domain/repositories/Login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl implements LoginRepoContract {
  final LoginRemoteDatasourceContract _loginDataSourceContract;

  LoginRepoImpl(this._loginDataSourceContract);

  @override
  Future<BaseResponse<LoginEntitiies>> gettUsers({
    required Map<String, dynamic> body,
  }) {
    final response = _loginDataSourceContract.getUsers(body: body);

    return response.then((value) {
      switch (value) {
        case SuccessBaseResponse<UserModel>():
          return SuccessBaseResponse<LoginEntitiies>(
            data: value.data.toEntity(),
          );

        case ErrorBaseResponse<UserModel>():
          return ErrorBaseResponse<LoginEntitiies>(exception: value.exception);
      }
    });
  }
}
