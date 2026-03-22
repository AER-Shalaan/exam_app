import 'package:exam_app/core/state/base_state.dart';
import 'package:exam_app/features/auth/login/domain/entities/login_entity.dart';

class LoginStates {
  BaseState<LoginEntity> loginState;
  bool isFormValid;

  LoginStates({BaseState<LoginEntity>? loginState, this.isFormValid = true})
    : loginState = loginState ?? BaseState<LoginEntity>();

  LoginStates copyWith({
    BaseState<LoginEntity>? loginState,
    bool? isFormValid,
  }) {
    return LoginStates(
      loginState: loginState ?? this.loginState,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
