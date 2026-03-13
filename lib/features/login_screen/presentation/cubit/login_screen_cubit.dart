import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/login_screen/data/models/get_user_model.dart';
import 'package:exam_app/features/login_screen/domain/usecases/login_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetUserCubit {
  final GettUserusecase _userusecase;

  SetUserCubit(this._userusecase);
  Future<void> setUsers() async {
    final users = await _userusecase.call();
    switch (users) {
      case SuccessBaseResponse<UserModel>():
        break;
      case ErrorBaseResponse<UserModel>():
        break;
    }
  }
}
