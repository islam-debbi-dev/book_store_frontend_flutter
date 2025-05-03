import 'package:booke_store/feattures/admin/adminhome/data/models/book.dart';
import 'package:booke_store/feattures/login/data/models/login_req.dart';
import 'package:booke_store/feattures/registration/data/models/registration_res.dart';
import 'package:dio/dio.dart';

import '../../feattures/login/data/models/login_res.dart';
import '../../feattures/registration/data/models/registration_req.dart';
import 'api_constants.dart';
import 'dio_generate.dart';

class Api {
  static Dio dio = DioGenerate.getDio();

  // login with dio
  Future<LoginRes> login(LoginReq loginReq) async {
    try {
      final response = await dio.post(
        '$baseUrl$authLogin',
        data: loginReq.toJson(),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return LoginRes.fromJson(data);
      } else {
        final errorMessage = 'Failed to login: ${response.statusCode}';
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorMessage = 'Failed to login: $e';
      throw Exception(errorMessage);
    }
  }

  // register with dio
  Future<RegistrationRes> register(RegistrationReq registrationReq) async {
    try {
      final response = await dio.post(
        '$baseUrl$authRegister',
        data: registrationReq.toJson(),
      );

      if (response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;
        return RegistrationRes.fromJson(data);
      } else {
        final errorMessage = 'Failed to register: ${response.statusCode}';
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorMessage = 'Failed to register: $e';
      throw Exception(errorMessage);
    }
  }

  Future<List<Book>> GetBooks() async {
    try {
      final response = await dio.get('$baseUrl$GetAllBooks');

      if (response.statusCode == 200) {
        // Assuming the response data is a list of book objects
        final List<dynamic> data = response.data as List<dynamic>;
        // Map each item in the list to a Book object
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
}
