import 'package:brasil_cripto/config/env.dart';
import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/data/services/http/http_client_exception.dart';
import 'package:brasil_cripto/data/services/http/http_client_interceptor.dart';
import 'package:brasil_cripto/data/services/http/http_client_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HttpClient)
class DioHttpClient implements HttpClient {
  DioHttpClient({@factoryParam BaseOptions? options}) {
    _dio = Dio(options ?? _options)
      ..interceptors.addAll([
        // LogInterceptor(),
        HttpClientInterceptor(),
      ]);
  }

  late Dio _dio;

  final _options = BaseOptions(
    baseUrl: Env.baseUrl,
    connectTimeout: const Duration(milliseconds: 60000),
    receiveTimeout: const Duration(milliseconds: 60000),
  );

  @override
  HttpClient auth() {
    _options.extra['auth_required'] = true;
    return this;
  }

  @override
  HttpClient unAuth() {
    _options.extra['auth_required'] = false;
    return this;
  }

  @override
  Future<HttpClientResponse<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers),
      );

      return HttpClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      throw HttpClientException(
        error: e.error,
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        response: _dioErrorConvert(e.response),
      );
    }
  }

  @override
  Future<HttpClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );

      return HttpClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      throw HttpClientException(
        error: e.error,
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        response: _dioErrorConvert(e.response),
      );
    }
  }

  @override
  Future<HttpClientResponse<T>> put<T>(
    String path, {
    T? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers),
      );

      return HttpClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      throw HttpClientException(
        error: e.error,
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        response: _dioErrorConvert(e.response),
      );
    }
  }

  @override
  Future<HttpClientResponse<T>> delete<T>(
    String path, {
    T? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers),
      );
      return HttpClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      throw HttpClientException(
        error: e.error,
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        response: _dioErrorConvert(e.response),
      );
    }
  }

  @override
  Future<HttpClientResponse<T>> patch<T>(
    String path, {
    T? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    try {
      final response = await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers),
      );

      return HttpClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      throw HttpClientException(
        error: e.error,
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        response: _dioErrorConvert(e.response),
      );
    }
  }

  @override
  Future<HttpClientResponse<T>> request<T>(
    String path, {
    required String method,
    T? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    try {
      final response = await _dio.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers, method: method),
      );

      return HttpClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      throw HttpClientException(
        error: e.error,
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        response: _dioErrorConvert(e.response),
      );
    }
  }

  HttpClientResponse<dynamic> _dioErrorConvert(Response<dynamic>? response) {
    return HttpClientResponse<dynamic>(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }
}
