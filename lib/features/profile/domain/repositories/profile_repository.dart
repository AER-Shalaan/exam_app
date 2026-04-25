import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';
import 'package:exam_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:exam_app/features/profile/data/models/change_password_request.dart';
import 'package:exam_app/features/profile/data/models/update_profile_request.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRepository {
  Future<BaseResponse<UserEntity>> getProfileData();
  Future<BaseResponse<UserEntity>> updateProfile(UpdateProfileRequest request);
  Future<BaseResponse<String>> changePassword(ChangePasswordRequest request);
}

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<BaseResponse<UserEntity>> getProfileData() async {
    return await _remoteDataSource.getProfileData();
  }

  @override
  Future<BaseResponse<UserEntity>> updateProfile(UpdateProfileRequest request) async {
    return await _remoteDataSource.updateProfile(request);
  }

  @override
  Future<BaseResponse<String>> changePassword(ChangePasswordRequest request) async {
    return await _remoteDataSource.changePassword(request);
  }
}
