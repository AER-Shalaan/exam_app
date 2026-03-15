import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/sign_up/apis/sign_up_request/sign_up_request.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entitiies.dart';
import 'package:exam_app/features/auth/sign_up/domain/repositories/sign_up_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetUserusecase {
  final SignUpRepoContract _repository;

  SetUserusecase(this._repository);
  Future<BaseResponse<SignUpEntitiies>> call(
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? password,
    String? rePassword,
  ) => _repository.setUsers(
    request: SignUpRequest(
      username: username.toString(),
      firstName: firstName.toString(),
      lastName: lastName.toString(),
      email: email.toString(),
      phone: phone.toString(),
      password: password.toString(),
      rePassword: rePassword.toString(),
    ),
  );
}
