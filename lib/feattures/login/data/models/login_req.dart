import 'package:json_annotation/json_annotation.dart';

part 'login_req.g.dart';

@JsonSerializable()
class LoginReq {
  String email;
  String password;

  LoginReq({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginReqToJson(this);
}
