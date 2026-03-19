import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:exam_app/features/auth/login/domain/repositories/login_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final LoginRepositoryContract _repository;

  LoginUsecase(this._repository);
  Future<BaseResponse<LoginEntity>> call(String? email, String? password) =>
      _repository.getUser(
        request: LoginRequest(
          email: email.toString(),
          password: password.toString(),
        ),
      );
}
