import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';
import 'package:exam_app/features/home/profile/data/datasources/profile_api_client.dart';
import 'package:exam_app/features/home/profile/data/models/change_password_request.dart';
import 'package:exam_app/features/home/profile/data/models/update_profile_request.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRemoteDataSource {
  Future<BaseResponse<UserEntity>> getProfileData();
  Future<BaseResponse<UserEntity>> updateProfile(UpdateProfileRequest request);
  Future<BaseResponse<String>> changePassword(ChangePasswordRequest request);
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiClient _profileApiClient;

  ProfileRemoteDataSourceImpl(this._profileApiClient);

  @override
  Future<BaseResponse<UserEntity>> getProfileData() async {
    try {
      final response = await _profileApiClient.getProfileData();
      return SuccessBaseResponse(data: response.toDomain());
    } on Exception catch (e) {
      return ErrorBaseResponse(exception: e);
    }
  }

  @override
  Future<BaseResponse<UserEntity>> updateProfile(UpdateProfileRequest request) async {
    try {
      final response = await _profileApiClient.updateProfile(await request.toFormData());
      return SuccessBaseResponse(data: response.toDomain());
    } on Exception catch (e) {
      return ErrorBaseResponse(exception: e);
    }
  }

  @override
  Future<BaseResponse<String>> changePassword(ChangePasswordRequest request) async {
    try {
      await _profileApiClient.changePassword(request.toJson());
      return SuccessBaseResponse(data: "Password changed successfully");
    } on Exception catch (e) {
      return ErrorBaseResponse(exception: e);
    }
  }
}
