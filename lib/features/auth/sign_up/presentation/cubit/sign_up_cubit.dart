import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/sign_up/data/models/sign_up_request/sign_up_request.dart';
import 'package:exam_app/features/auth/sign_up/domain/entities/sign_up_entitiies.dart';
import 'package:exam_app/features/auth/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:exam_app/features/auth/sign_up/presentation/cubit/sign_up_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetUserCubit extends Bloc<SignUpEvent, BaseState> {
  final SetUserusecase _userusecase;

  SetUserCubit(this._userusecase) : super(BaseState()) {
    on<SignUpEventSetUsers>(
      (event, emit) => _setUsers(event.request, emit, event),
    );
  }
  Future<void> _setUsers(
    SignUpRequest request,
    Emitter<BaseState> emit,
    SignUpEventSetUsers event,
  ) async {
    emit(state.copyWith(isLoadingParam: true));
    final users = await _userusecase.call();
    switch (users) {
      case SuccessBaseResponse<SignUpEntitiies>():
        emit(state.copyWith(isLoadingParam: false, dataParam: users.data));
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
}
