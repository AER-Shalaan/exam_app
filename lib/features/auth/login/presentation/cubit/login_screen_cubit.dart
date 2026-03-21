import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/core/storage/secure_storage.dart';
import 'package:exam_app/features/auth/login/Apis/request/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entity.dart';
import 'package:exam_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:exam_app/features/auth/login/presentation/cubit/login_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenCubit extends Cubit<BaseState<LoginEntity>> {
  final LoginUsecase _userusecase;

  LoginScreenCubit(this._userusecase) : super(BaseState<LoginEntity>());
  Future<void> _getUsers(LoginRequest request) async {
    emit(state.copyWith(isLoadingParam: true));
    final users = await _userusecase.call(request.email, request.password);
    switch (users) {
      case SuccessBaseResponse<LoginEntity>():
        emit(state.copyWith(isLoadingParam: false, dataParam: users.data));
        SecureStorage.saveToken(state.data?.token ?? "");
        break;
      case ErrorBaseResponse<LoginEntity>():
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
