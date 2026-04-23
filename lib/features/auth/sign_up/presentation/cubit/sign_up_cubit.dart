import 'package:exam_app/core/auth/token_manager.dart';
import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/auth/sign_up/apis/sign_up_request/sign_up_request.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:exam_app/features/auth/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_events.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpCubit extends Cubit<SignUpStates> {
  final SetUserusecase _userusecase;

  SignUpCubit(this._userusecase) : super(SignUpStates());

  void doEvent(SignUpEvent event) {
    switch (event) {
      case SignUpEventSetUsers():
        _setUsers(event.request);
        break;
    }
  }

  Future<void> _setUsers(SignUpRequest request) async {
    emit(
      state.copyWith(
        signUpState: state.signUpState.copyWith(isLoadingParam: true, dataParam: null, errorMessageParam: null),
      ),
    );

    final response = await _userusecase.call(request);
    switch (response) {
      case SuccessBaseResponse<SignUpEntity>():
        final data = response.data;
        if (data.token!.isNotEmpty) {
          await TokenManager.setToken(data.token!, rememberMe: false);
        }
        emit(
          state.copyWith(
            signUpState: state.signUpState.copyWith(
              isLoadingParam: false,
              dataParam: data,
            ),
          ),
        );
        break;
      case ErrorBaseResponse<SignUpEntity>():
        final error = response.errorMessage;
        emit(
          state.copyWith(
            signUpState: state.signUpState.copyWith(
              isLoadingParam: false,
              errorMessageParam: error,
            ),
          ),
        );
        break;
    }
  }
}

