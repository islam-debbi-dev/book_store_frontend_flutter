import 'package:booke_store/feattures/admin/adminhome/data/models/book.dart';
import 'package:booke_store/feattures/login/data/models/login_req.dart';
import 'package:booke_store/feattures/registration/data/models/registration_res.dart';
import 'package:dio/dio.dart';

import '../../feattures/admin/adminhome/data/models/author.dart';
import '../../feattures/login/data/models/login_res.dart';
import '../../feattures/registration/data/models/registration_req.dart';
import 'api_constants.dart';
import 'api_error_model.dart';
import 'dio_generate.dart';

class Api {
  static Dio dio = DioGenerate.getDio();

  // login with dio
  Future<dynamic> login(LoginReq loginReq) async {
    final response = await dio.post(
      '$baseUrl$authLogin',
      data: loginReq.toJson(),
    );

    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return LoginRes.fromJson(data);
    } else {
      final data = response.data as Map<String, dynamic>;

      return ApiErrorModel.fromJson(data);
    }
  }

  // register with dio
  Future<dynamic> register(RegistrationReq registrationReq) async {
    final response = await dio.post(
      '$baseUrl$authRegister',
      data: registrationReq.toJson(),
    );

    if (response.statusCode == 201) {
      final data = response.data as Map<String, dynamic>;
      return RegistrationRes.fromJson(data);
    } else {
      final data = response.data as Map<String, dynamic>;

      return ApiErrorModel.fromJson(data);
    }
  }

  Future<List<Book>> GetBooks() async {
    try {
      final response = await dio.get('$baseUrl$GetAllBooks');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        final List<Book> books = data
            .map((bookJson) => Book.fromJson(bookJson as Map<String, dynamic>))
            .toList();
        return books;
      } else {
        final errorMessage = 'Failed to load books: ${response.statusCode}';
        throw Exception(errorMessage);
      }
    } catch (e) {
      // Handle Dio errors or other exceptions
      final errorMessage = 'Failed to load books: $e';
      throw Exception(errorMessage);
    }
  }

  Future<List<Author>> GetAuthors([pageNumber = 1, authorsPerPage = 10]) async {
    try {
      final response = await dio.get(
          '$baseUrl$GetAllAuthors?pageNumber=$pageNumber&authorsPerPage=$authorsPerPage');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        final List<Author> author = data
            .map(
                (bookJson) => Author.fromJson(bookJson as Map<String, dynamic>))
            .toList();
        return author;
      } else {
        final errorMessage = 'Failed to load authors: ${response.statusCode}';
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception('Failed to load authors: $e');
    }
  }
}
