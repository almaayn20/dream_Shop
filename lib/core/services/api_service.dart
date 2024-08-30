import 'package:dio/dio.dart';

import '../api_routes.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = ApiConstants.endPointUrl;
    _dio.options.headers = ApiConstants.getHeaders();
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response.data;
  }

  Future<List<dynamic>> getList({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response.data;
  }

  Future<Response> post(
      {required String endPoint,
      dynamic data,
      Map<String, dynamic>? queryParameters}) async {
    Response response =
        await _dio.post(endPoint, data: data, queryParameters: queryParameters);
    return response;
  }

  Future<Response> put(
      {required String endPoint,
      dynamic data,
      Map<String, dynamic>? queryParameters}) async {
    Response response =
        await _dio.put(endPoint, data: data, queryParameters: queryParameters);
    return response;
  }

  Future<Response> delete(
      {required String endPoint,
      dynamic data,
      Map<String, dynamic>? queryParameters}) async {
    Response response = await _dio.delete(endPoint,
        data: data, queryParameters: queryParameters);
    return response;
  }

  Future<http.Response> paymentPost({
    required dynamic body,
    required String url,
    required String token,
    Map<String, String>? headers,
    String? contentType,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers ??
          {
            'Authorization': "Bearer $token",
            'Content-Type': contentType ?? 'application/json',
          },
      body: body,
    );

    return response;
  }
}
