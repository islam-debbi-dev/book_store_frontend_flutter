// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRes _$RegistrationResFromJson(Map<String, dynamic> json) =>
    RegistrationRes(
      id: json['_id'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: (json['__v'] as num?)?.toInt(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$RegistrationResToJson(RegistrationRes instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'isAdmin': instance.isAdmin,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.iV,
      'token': instance.token,
    };
