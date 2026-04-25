import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';

class ProfileStates {
  BaseState<UserEntity> profileState;
  BaseState<UserEntity> updateProfileState;
  BaseState<String> changePasswordState;

  ProfileStates({
    BaseState<UserEntity>? profileState,
    BaseState<UserEntity>? updateProfileState,
    BaseState<String>? changePasswordState,
  })  : profileState = profileState ?? BaseState<UserEntity>(),
        updateProfileState = updateProfileState ?? BaseState<UserEntity>(),
        changePasswordState = changePasswordState ?? BaseState<String>();

  ProfileStates copyWith({
    BaseState<UserEntity>? profileState,
    BaseState<UserEntity>? updateProfileState,
    BaseState<String>? changePasswordState,
  }) {
    return ProfileStates(
      profileState: profileState ?? this.profileState,
      updateProfileState: updateProfileState ?? this.updateProfileState,
      changePasswordState: changePasswordState ?? this.changePasswordState,
    );
  }
}
