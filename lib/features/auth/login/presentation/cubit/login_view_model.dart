import 'package:exam_app/core/auth/token_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:exam_app/features/auth/login/apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:exam_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:exam_app/features/auth/login/presentation/cubit/login_events.dart';
import 'package:exam_app/features/auth/login/presentation/cubit/login_states.dart';
import 'package:exam_app/core/network/base_response.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  final LoginUsecase _loginUsecase;

  LoginViewModel(this._loginUsecase) : super(LoginStates());

  void doEvent(LoginEvents event) {
    switch (event) {
      case LoginUserEvent():
        _loginUser(event.request, event.rememberMe);
        break;
    }
  }

  Future<void> _loginUser(LoginRequest request, bool rememberMe) async {
    emit(
      state.copyWith(
        loginState: state.loginState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
          dataParam: null,
        ),
      ),
    );

    final response = await _loginUsecase.call(request);

    switch (response) {
      case SuccessBaseResponse<LoginEntity>():
        final data = response.data;

        if (rememberMe || data.token.isNotEmpty) {
          await TokenManager.setToken(data.token, rememberMe: rememberMe);
        }

        emit(
          state.copyWith(
            loginState: state.loginState.copyWith(
              isLoadingParam: false,
              dataParam: data,
            ),
          ),
        );
        break;

      case ErrorBaseResponse<LoginEntity>():
        final error = response.errorMessage;
        emit(
          state.copyWith(
            loginState: state.loginState.copyWith(
              isLoadingParam: false,
              errorMessageParam: error,
            ),
          ),
        );
        break;
    }
  }
}
