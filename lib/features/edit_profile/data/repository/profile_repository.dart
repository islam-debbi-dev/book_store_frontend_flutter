import '../../../../core/service/Api.dart';
import '../../../../core/service/api_error_handler.dart';
import '../../../../core/service/api_error_model.dart';
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

  // update user
  Future<ApiResult<void>> updateCurrentUser(
      UserProfileRes userProfileRes) async {
    try {
      final data = await api.updateCurrentUser(userProfileRes);
      if (!data is ApiErrorModel) {
        return ApiResult.failure(ErrorHandler.handle(data));
      } else {
        final data = 'user updated successfully';
        return ApiResult.success(data);
      }
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
