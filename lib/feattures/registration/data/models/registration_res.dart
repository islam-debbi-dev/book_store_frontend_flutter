import 'package:json_annotation/json_annotation.dart';

part 'registration_res.g.dart';

@JsonSerializable()
class RegistrationRes {
  @JsonKey(name: '_id')
  String? id;
  String? email;
  String? username;
  bool? isAdmin;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: '__v')
  int? iV;
  String? token;

  RegistrationRes(
      {this.id,
      this.email,
      this.username,
      this.isAdmin,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.token});

  factory RegistrationRes.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResFromJson(json);
}
