sealed class LoginEvents {}

class GetUser extends LoginEvents {
  final bool request;
  GetUser({required this.request});
}
