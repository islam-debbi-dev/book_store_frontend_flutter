import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'api_constants.dart';
import 'dio_generate.dart';

class Api {

  static Dio dio = DioGenerate.getDio();

  // login with dio
  

  static Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Save token or handle login success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful')),
        );
        print('Login successful: ${data.toString()}');
        Navigator.pushNamed(context, '/home');
      } else {
        final data = jsonDecode(response.body);
        final errorMessage = data['message'] ?? 'Failed to login';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
        print('Failed to login: $errorMessage');
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorMessage = 'Failed to login: $e';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      print(errorMessage);
      throw Exception(errorMessage);
    }
  }

  static Future<void> register(String email, String username, String password,
      BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        // Save token or handle registration success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful')),
        );
        print('Registration successful: ${data.toString()}');
        Navigator.pushNamed(context, '/home');
      } else {
        final data = jsonDecode(response.body);
        final errorMessage = data['message'] ?? 'Failed to register';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
        print('Failed to register: $errorMessage');
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorMessage = 'Failed to register: $e';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      print(errorMessage);
      throw Exception(errorMessage);
    }
  }
}
