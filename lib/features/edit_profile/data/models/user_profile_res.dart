import 'package:json_annotation/json_annotation.dart';

part 'user_profile_res.g.dart';

@JsonSerializable()
class UserProfileRes {
  @JsonKey(name: '_id')
  String id;
  String? email;
  String? username;
  bool? isAdmin;
  String? password;

  UserProfileRes(
      {required this.id,
      this.email,
      this.username,
      this.isAdmin,
      this.password});
  factory UserProfileRes.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResToJson(this);
}
