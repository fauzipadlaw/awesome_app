import 'package:awesome_app/core/constants/string.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio() {
    _dio.options.baseUrl = baseApi;
    _dio.options.headers = {
      'Authorization': apiKey,
    };
  }

  Future<Response> get(String path, {Map<String, dynamic>? params}) async {
    try {
      return await _dio.get(path, queryParameters: params);
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}
