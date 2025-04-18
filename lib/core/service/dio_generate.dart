import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioGenerate {
  static Dio? dio;
  DioGenerate._internal();

  static Dio getDio() {
    Duration timeout = Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addDioHeaders();
      addDioInreceptors();
    }
    return dio!;
  }

  static void addDioHeaders() {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static void addDioInreceptors() {
    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    ));
  }
}
