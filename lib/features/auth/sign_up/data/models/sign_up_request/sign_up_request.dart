class SignUpRequest {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? rePassword;

  SignUpRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.rePassword,
  });

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    rePassword = json['rePassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['rePassword'] = rePassword;
    return data;
  }
}
