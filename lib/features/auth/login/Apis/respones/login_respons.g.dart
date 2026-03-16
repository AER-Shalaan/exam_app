// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_respons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRespon _$LoginResponFromJson(Map<String, dynamic> json) => LoginRespon(
  message: json['message'] as String?,
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : userModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginResponToJson(LoginRespon instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
