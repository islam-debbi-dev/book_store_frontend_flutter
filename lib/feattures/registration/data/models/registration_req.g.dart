// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationReq _$RegistrationReqFromJson(Map<String, dynamic> json) =>
    RegistrationReq(
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RegistrationReqToJson(RegistrationReq instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };
