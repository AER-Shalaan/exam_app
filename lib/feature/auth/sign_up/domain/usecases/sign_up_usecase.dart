import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/feature/auth/sign_up/data/models/sign_up_request/sign_up_request.dart';
import 'package:exam_app/feature/auth/sign_up/domain/entities/sign_up_entitiies.dart';
import 'package:exam_app/feature/auth/sign_up/domain/repositories/sign_up_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetUserusecase {
  final SignUpRepoContract _repository;

  SetUserusecase(this._repository);
  Future<BaseResponse<SignUpEntitiies>> call() =>
      _repository.setUsers(request: SignUpRequest());
}
