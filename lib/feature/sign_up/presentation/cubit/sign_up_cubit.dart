import 'package:exam_app/feature/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class setUserCubit {
  final setUserusecase _userusecase;

  setUserCubit(this._userusecase);
  Future<void> setUsers() async {
    final users = await _userusecase.call();
    users.forEach((e) {
      print(e.email);
    });
  }
}
