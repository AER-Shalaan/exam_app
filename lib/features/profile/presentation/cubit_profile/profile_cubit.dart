import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/login/domain/entities/user_entity.dart';
import 'package:exam_app/features/profile/presentation/cubit_profile/profile_events.dart';
import 'package:exam_app/features/profile/presentation/cubit_profile/profile_states.dart';
import 'package:exam_app/features/profile/data/models/update_profile_request.dart';
import 'package:exam_app/features/profile/data/models/change_password_request.dart';
import 'package:exam_app/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:exam_app/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:exam_app/features/profile/domain/usecases/update_profile_usecase.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileStates> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;

  ProfileCubit(
    this._getProfileUseCase,
    this._updateProfileUseCase,
    this._changePasswordUseCase,
  ) : super(ProfileStates());

  void doEvent(ProfileEvents event) {
    switch (event) {
      case GetProfileEvent():
        _getProfileData();
        break;
      case UpdateProfileEvent():
        _updateProfileData(event.request);
        break;
      case ChangePasswordEvent():
        _changePasswordData(event.request);
        break;
    }
  }

  Future<void> _getProfileData() async {
    emit(
      state.copyWith(
        profileState: state.profileState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
          dataParam: null,
        ),
      ),
    );

    final response = await _getProfileUseCase.call();

    switch (response) {
      case SuccessBaseResponse<UserEntity>():
        emit(
          state.copyWith(
            profileState: state.profileState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        break;

      case ErrorBaseResponse<UserEntity>():
        emit(
          state.copyWith(
            profileState: state.profileState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> _updateProfileData(UpdateProfileRequest request) async {
    emit(
      state.copyWith(
        updateProfileState: state.updateProfileState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
          dataParam: null,
        ),
      ),
    );

    final response = await _updateProfileUseCase.call(request);

    switch (response) {
      case SuccessBaseResponse<UserEntity>():
        emit(
          state.copyWith(
            updateProfileState: state.updateProfileState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
            profileState: state.profileState.copyWith(
              dataParam: response.data,
            ),
          ),
        );
        break;

      case ErrorBaseResponse<UserEntity>():
        emit(
          state.copyWith(
            updateProfileState: state.updateProfileState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> _changePasswordData(ChangePasswordRequest request) async {
    emit(
      state.copyWith(
        changePasswordState: state.changePasswordState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
          dataParam: null,
        ),
      ),
    );

    final response = await _changePasswordUseCase.call(request);

    switch (response) {
      case SuccessBaseResponse<String>():
        emit(
          state.copyWith(
            changePasswordState: state.changePasswordState.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        break;

      case ErrorBaseResponse<String>():
        emit(
          state.copyWith(
            changePasswordState: state.changePasswordState.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        break;
    }
  }
}
