sealed class LoginEvents {}

class GetUser extends LoginEvents {
  final bool isValid;
  GetUser({required this.isValid});
}

class LoginEmailEvent extends LoginEvents {
  final String email;

  LoginEmailEvent({required this.email});
}

class PasswordCodeEvent extends LoginEvents {
  final String password;
  PasswordCodeEvent({required this.password});
}
