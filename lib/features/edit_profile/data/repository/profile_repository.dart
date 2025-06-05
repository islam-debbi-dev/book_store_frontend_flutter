import '../../../../core/service/Api.dart';
import '../../../../core/service/api_error_handler.dart';
import '../../../../core/service/api_result.dart';
import '../models/user_profile_res.dart';

class ProfileRepository {
  final Api api;

  ProfileRepository(this.api);

  Future<ApiResult<UserProfileRes>> getCurrentUser() async {
    try {
      final data = await api.getCurrentUser();
      if (data is UserProfileRes) {
        return ApiResult.success(data);
      } else {
        return ApiResult.failure(ErrorHandler.handle(data));
      }
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
