import 'package:exam_app/features/profile/data/models/change_password_request.dart';
import 'package:exam_app/features/profile/data/models/update_profile_request.dart';

sealed class ProfileEvents {}

class GetProfileEvent extends ProfileEvents {}

class UpdateProfileEvent extends ProfileEvents {
  final UpdateProfileRequest request;

  UpdateProfileEvent(this.request);
}

class ChangePasswordEvent extends ProfileEvents {
  final ChangePasswordRequest request;

  ChangePasswordEvent(this.request);
}
