import 'package:exam_app/feature/sign_up/domain/entities/sign_up_entitiies.dart';

abstract class SignUpRepoContract {
  Future<List<SignUpEntitiies>> setUsers();
}
