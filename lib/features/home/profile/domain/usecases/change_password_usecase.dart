import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/home/profile/data/models/change_password_request.dart';
import 'package:exam_app/features/home/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepository _repository;

  ChangePasswordUseCase(this._repository);

  Future<BaseResponse<String>> call(ChangePasswordRequest request) async {
    return await _repository.changePassword(request);
  }
}
