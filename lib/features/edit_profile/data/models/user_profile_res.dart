import 'package:json_annotation/json_annotation.dart';

part 'user_profile_res.g.dart';

@JsonSerializable()
class UserProfileRes {
  @JsonKey(name: '_id')
  String id;
  String? email;
  String? username;
  bool? isAdmin;
  UserProfileRes({required this.id, this.email, this.username, this.isAdmin});
  factory UserProfileRes.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResFromJson(json);
}
