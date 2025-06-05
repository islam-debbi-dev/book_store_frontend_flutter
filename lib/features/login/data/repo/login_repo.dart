import 'package:booke_store/core/service/Api.dart';
import 'package:booke_store/core/service/api_error_handler.dart';
import 'package:booke_store/core/service/api_result.dart';
import 'package:booke_store/features/login/data/models/login_req.dart';
import 'package:booke_store/features/login/data/models/login_res.dart';

class LoginRepo {
  final Api api;

  LoginRepo(this.api);

  Future<ApiResult<LoginRes>> login(LoginReq loginreq) async {
    try {
      final data = await api.login(loginreq);
      if (data is LoginRes) {
        return ApiResult.success(data);
      } else {
        return ApiResult.failure(ErrorHandler.handle(data));
      }
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
