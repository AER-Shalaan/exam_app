// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetUserResponse _$SetUserResponseFromJson(Map<String, dynamic> json) =>
    SetUserResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetUserResponseToJson(SetUserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
