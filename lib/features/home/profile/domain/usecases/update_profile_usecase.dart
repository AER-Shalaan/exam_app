import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';
import 'package:exam_app/features/home/profile/data/models/update_profile_request.dart';
import 'package:exam_app/features/home/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  Future<BaseResponse<UserEntity>> call(UpdateProfileRequest request) async {
    return await _repository.updateProfile(request);
  }
}
