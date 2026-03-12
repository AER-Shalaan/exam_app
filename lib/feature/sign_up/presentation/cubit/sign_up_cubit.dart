import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/feature/sign_up/data/models/user_model.dart';
import 'package:exam_app/feature/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetUserCubit {
  final SetUserusecase _userusecase;

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
