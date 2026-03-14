import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/data/models/get_user_model.dart';
import 'package:exam_app/features/auth/presentation/cubit/login_events.dart';

import 'package:exam_app/features/login_screen/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserCubit extends Cubit<BaseState> {
  final GetUserusecase _userusecase;

  GetUserCubit(this._userusecase) : super(BaseState());
  Future<void> getUser(LoginEvents request) async {
    emit(state.copyWith(isLoadingParam: true));
    final users = await _userusecase.call();
    switch (users) {
      // case SuccessBaseResponse<LoginEntitiies>():
      //   emit(state.copyWith(isLoadingParam: false, dataParam: users.data));

      //   break;
      // case ErrorBaseResponse<LoginEntitiies>():
      //   emit(
      //     state.copyWith(
      //       isLoadingParam: false,
      //       errorMessageParam: users.exception.toString(),
      //     ),
      //   );
      //   break;
      case SuccessBaseResponse<UserModel>():
        emit(state.copyWith(isLoadingParam: false, dataParam: users.data));
        break;
      case ErrorBaseResponse<UserModel>():
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
