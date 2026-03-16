import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/login/Apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entitiies.dart';
import 'package:exam_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:exam_app/features/auth/login/presentation/cubit/login_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenCubit extends Cubit<BaseState<LoginEntitiies>> {
  final LoginUsecase _userusecase;

  LoginScreenCubit(this._userusecase) : super(BaseState<LoginEntitiies>());
  Future<void> _getUsers(LoginRequest request) async {
    emit(state.copyWith(isLoadingParam: true));
    final users = await _userusecase.call(request.email, request.password);
    switch (users) {
      case SuccessBaseResponse<LoginEntitiies>():
        emit(state.copyWith(isLoadingParam: false, dataParam: users.data));

        break;
      case ErrorBaseResponse<LoginEntitiies>():
        emit(
          state.copyWith(
            isLoadingParam: false,
            errorMessageParam: users.exception.toString(),
          ),
        );
        break;
    }
  }

  void doEvent(LoginEvents event) {
    switch (event) {
      case GetUser():
        _getUsers(event.request as LoginRequest);
        break;
    }
  }
}
