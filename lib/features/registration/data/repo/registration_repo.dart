import 'package:booke_store/core/service/Api.dart';

import '../models/registration_req.dart';
import '../models/registration_res.dart';
import 'package:booke_store/core/service/api_error_handler.dart';
import 'package:booke_store/core/service/api_result.dart';

class RegistrationRepo {
  final Api api;
  RegistrationRepo(this.api);

  Future<ApiResult<RegistrationRes>> register(
      RegistrationReq registrationReq) async {
    try {
      final data = await api.register(registrationReq);
      if (data is RegistrationRes) {
        return ApiResult.success(data);
      } else {
        return ApiResult.failure(ErrorHandler.handle(data));
      }
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
