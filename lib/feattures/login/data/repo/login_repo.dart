import 'package:booke_store/core/service/Api.dart';
import 'package:booke_store/feattures/login/data/models/login_req.dart';
import 'package:booke_store/feattures/login/data/models/login_res.dart';

class LoginRepo {
  final Api api;

  LoginRepo(this.api);

  Future<LoginRes> login(LoginReq loginreq) async {
    try {
      final data = await api.login(loginreq);

      return data;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
