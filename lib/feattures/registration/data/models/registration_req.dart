import 'package:json_annotation/json_annotation.dart';

part 'registration_req.g.dart';

@JsonSerializable()
class RegistrationReq {
  String? email;
  String? username;
  String? password;

  RegistrationReq({this.email, this.username, this.password});

  Map<String, dynamic> toJson() => _$RegistrationReqToJson(this);
}
