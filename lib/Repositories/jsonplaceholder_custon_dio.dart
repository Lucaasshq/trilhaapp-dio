import 'package:dio/dio.dart';

class JsonplaceholderCustonDio {
  var _dio = Dio();
  Dio getDio() => _dio;
  JsonplaceholderCustonDio() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
  }
}
