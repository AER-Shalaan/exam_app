import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';
import 'package:exam_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepository _repository;

  GetProfileUseCase(this._repository);

  Future<BaseResponse<UserEntity>> call() async {
    return await _repository.getProfileData();
  }
}
