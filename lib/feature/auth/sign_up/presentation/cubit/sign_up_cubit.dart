import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/feature/auth/sign_up/data/mappers/sign_up_mappers.dart';
import 'package:exam_app/feature/auth/sign_up/data/models/sign_up_request/sign_up_request.dart';
import 'package:exam_app/feature/auth/sign_up/data/models/user_model.dart';
import 'package:exam_app/feature/auth/sign_up/domain/entities/sign_up_entitiies.dart';
import 'package:exam_app/feature/auth/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:exam_app/feature/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetUserCubit extends Cubit<SignUpState> {
  final SetUserusecase _userusecase;

  SetUserCubit(this._userusecase) : super(SignUpInitial());
  Future<void> setUsers(SignUpRequest request) async {
    emit(SignUpLoading());
    final users = await _userusecase.call( );
    switch (users) {
      case SuccessBaseResponse<SignUpEntitiies>():
        print(users.data);
        emit(
          SignUpSuccess<SignUpEntitiies>(
            signUpEntitiies: users.data,
          ),
        );

        break;
      case ErrorBaseResponse<SignUpEntitiies>():
        print(users.exception);
        emit(SignUpError<SignUpEntitiies>(message: users.exception.toString()));
        break;
    }
  }
}
