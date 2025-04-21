import 'package:booke_store/core/service/Api.dart';

import '../models/registration_req.dart';
import '../models/registration_res.dart';

class RegistrationRepo {
  final Api api;
  RegistrationRepo(this.api);

  Future<RegistrationRes> register(RegistrationReq registrationReq) async {
    try {
      final response = await api.register(registrationReq);
      return response;
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}
