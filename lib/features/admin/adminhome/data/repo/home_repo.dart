import 'package:booke_store/features/admin/adminhome/data/models/author.dart';

import '../../../../../core/service/Api.dart';
import '../../../../../core/service/api_error_handler.dart';
import '../../../../../core/service/api_result.dart';
import '../models/book.dart';

class HomeRepo {
  final Api api;

  HomeRepo(this.api);

  Future<ApiResult<List<Book>>> GetBooks() async {
    try {
      final data = await api.GetBooks();
      if (data is List<Book>) {
        return ApiResult.success(data);
      } else {
        return ApiResult.failure(ErrorHandler.handle(data));
      }
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<Author>>> GetAuthor(
      int pageNumber, int authorsPerPage) async {
    try {
      final data = await api.GetAuthors(pageNumber, authorsPerPage);
      if (data is List<Author>) {
        return ApiResult.success(data);
      } else {
        return ApiResult.failure(ErrorHandler.handle(data));
      }
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<Book>>> filterBooks(int minPrice, int maxPrice) async {
    try {
      final data =
          await api.filterBooks(minPrice: minPrice, maxPrice: maxPrice);
      if (data is List<Book>) {
        return ApiResult.success(data);
      } else {
        return ApiResult.failure(ErrorHandler.handle(data));
      }
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
