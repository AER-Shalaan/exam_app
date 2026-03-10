class UserModel {
  String? userName;
  String? email;
  String? password;

  UserModel({this.userName, this.email, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
  // SignUpEntitiies toEntity() =>
  //     SignUpEntitiies(name: userName, email: email, password: password);
}
