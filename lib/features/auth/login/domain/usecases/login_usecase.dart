import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/Apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entitiies.dart';
import 'package:exam_app/features/auth/login/domain/repositories/Login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final LoginRepoContract _repository;

  LoginUsecase(this._repository);
  Future<BaseResponse<LoginEntitiies>> call(

    String? email,

    String? password,

  ) => _repository.gettUsers(

    request: LoginRequest(email: email.toString(), password: password.toString()),

    );

}
