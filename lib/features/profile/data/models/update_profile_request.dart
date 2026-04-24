import 'dart:io';
import 'package:dio/dio.dart';

class UpdateProfileRequest {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final File? profilePic;

  UpdateProfileRequest({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.profilePic,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      if (profilePic != null)
        'profilePic': await MultipartFile.fromFile(
          profilePic!.path,
          filename: profilePic!.path.split('/').last,
        ),
    });
  }
}
