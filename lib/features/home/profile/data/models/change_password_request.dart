class ChangePasswordRequest {
  final String oldPassword;
  final String password;
  final String rePassword;

  ChangePasswordRequest({
    required this.oldPassword,
    required this.password,
    required this.rePassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'password': password,
      'rePassword': rePassword,
    };
  }
}
