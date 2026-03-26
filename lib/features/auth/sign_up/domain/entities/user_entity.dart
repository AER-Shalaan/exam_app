class UserEntity {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? id;
  DateTime? createdAt;

  UserEntity({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  UserEntity copyWith({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? role,
    bool? isVerified,
    String? id,
    DateTime? createdAt,
  }) {
    return UserEntity(
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      isVerified: isVerified ?? this.isVerified,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
