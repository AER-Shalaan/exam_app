import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/sign_up/apis/sign_up_request/sign_up_request.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entitiies.dart';
import 'package:exam_app/features/auth/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpCubit extends Cubit<BaseState<SignUpEntitiies>> {
  final SetUserusecase _userusecase;

  SignUpCubit(this._userusecase) : super(BaseState<SignUpEntitiies>());
  Future<void> _setUsers(SignUpRequest request) async {
    emit(state.copyWith(isLoadingParam: true));
    final users = await _userusecase.call(
      request.username,
      request.firstName,
      request.lastName,
      request.email,
      request.phone,
      request.password,
      request.rePassword,
    );
    switch (users) {
      case SuccessBaseResponse<SignUpEntitiies>():
        emit(state.copyWith(isLoadingParam: false, dataParam: users.data.token ?? ""));

        break;
      case ErrorBaseResponse<SignUpEntitiies>():
        emit(
          state.copyWith(
            isLoadingParam: false,
            errorMessageParam: users.exception.toString(),
          ),
        );
        break;
    }
  }

  void doEvent(SignUpEvent event) {
    switch (event) {
      case SignUpEventSetUsers():
        _setUsers(event.request);
        break;
    }
  }
}
