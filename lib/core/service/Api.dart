import 'package:booke_store/features/admin/adminhome/data/models/book.dart';
import 'package:booke_store/features/login/data/models/login_req.dart';
import 'package:booke_store/features/registration/data/models/registration_res.dart';
import 'package:dio/dio.dart';

import '../../features/admin/adminhome/data/models/author.dart';
import '../../features/login/data/models/login_res.dart';
import '../../features/edit_profile/data/models/user_profile_res.dart';
import '../../features/registration/data/models/registration_req.dart';
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

  // fetch current user
  Future<dynamic> getCurrentUser() async {
    final response = await dio.get('$baseUrl$currentuser');

    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return UserProfileRes.fromJson(data);
    } else {
      final data = response.data as Map<String, dynamic>;

      return ApiErrorModel.fromJson(data);
    }
  }

  // update current user
  Future<dynamic> updateCurrentUser(UserProfileRes userProfileRes) async {
    String? update;
    final Map<String, dynamic> updateJson = {};

    if (userProfileRes.password != null) {
      update = userProfileRes.password.toString();
      updateJson['password'] = update;
    }
    if (userProfileRes.email != null) {
      update = userProfileRes.email.toString();
      updateJson['email'] = update;
    }
    if (userProfileRes.username != null) {
      update = userProfileRes.username.toString();
      updateJson['username'] = update;
    }

    final response = await dio.put('$baseUrl$currentuser', data: updateJson);

    if (response.statusCode != 200) {
      final data = response.data as Map<String, dynamic>;

      return ApiErrorModel.fromJson(data);
    }
  }

  // get books
  Future<dynamic> GetBooks() async {
    final response = await dio.get('$baseUrl$GetAllBooks');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data as List<dynamic>;
      final List<Book> books = data
          .map((bookJson) => Book.fromJson(bookJson as Map<String, dynamic>))
          .toList();
      return books;
    } else {
      final data = response.data as Map<String, dynamic>;

      return ApiErrorModel.fromJson(data);
    }
  }

  Future<dynamic> GetAuthors([pageNumber = 1, authorsPerPage = 10]) async {
    final response = await dio.get(
        '$baseUrl$GetAllAuthors?pageNumber=$pageNumber&authorsPerPage=$authorsPerPage');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data as List<dynamic>;
      final List<Author> author = data
          .map((bookJson) => Author.fromJson(bookJson as Map<String, dynamic>))
          .toList();
      return author;
    } else {
      final data = response.data as Map<String, dynamic>;

      return ApiErrorModel.fromJson(data);
    }
  }
}
