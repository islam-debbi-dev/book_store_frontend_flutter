import 'package:booke_store/feattures/admin/adminhome/data/models/author.dart';

import '../../../../../core/service/Api.dart';
import '../models/book.dart';

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
}
