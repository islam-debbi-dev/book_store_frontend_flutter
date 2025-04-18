import 'package:json_annotation/json_annotation.dart';

part 'login_res.g.dart';

@JsonSerializable()
class LoginRes {
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

  LoginRes(
      {this.id,
      this.email,
      this.username,
      this.isAdmin,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.token});

  factory LoginRes.fromJson(Map<String, dynamic> json) =>
      _$LoginResFromJson(json);
}
