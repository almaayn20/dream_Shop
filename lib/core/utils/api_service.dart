import 'package:dio/dio.dart';

import '../api_routes.dart';

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
}
