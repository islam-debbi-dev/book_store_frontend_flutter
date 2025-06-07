// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileRes _$UserProfileResFromJson(Map<String, dynamic> json) =>
    UserProfileRes(
      id: json['_id'] as String,
      email: json['email'] as String?,
      username: json['username'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserProfileResToJson(UserProfileRes instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'isAdmin': instance.isAdmin,
      'password': instance.password,
    };
