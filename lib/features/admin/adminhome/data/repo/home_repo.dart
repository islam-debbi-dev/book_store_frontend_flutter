import 'package:booke_store/features/admin/adminhome/data/models/author.dart';

import '../../../../../core/service/Api.dart';
import '../../../../../core/service/api_error_handler.dart';
import '../../../../../core/service/api_result.dart';
import '../models/book.dart';
import '../../../../edit_profile/data/models/user_profile_res.dart';

class HomeRepo {
  final Api api;

  HomeRepo(this.api);

  Future<List<Book>> GetBooks() async {
    try {
      final data = await api.GetBooks();
      return data;
    } catch (e) {
      return throw Exception('Login failed: $e');
    }
  }

  Future<List<Author>> GetAuthor(int pageNumber, int authorsPerPage) async {
    try {
      final data = await api.GetAuthors(pageNumber, authorsPerPage);
      return data;
    } catch (e) {
      return throw Exception('Login failed: $e');
    }
  }

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
