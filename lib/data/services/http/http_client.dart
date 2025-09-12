import 'dart:async';

import 'package:brasil_cripto/data/services/http/http_client_response.dart';
import 'package:dio/dio.dart';

abstract class HttpClient {
  HttpClient auth();
  HttpClient unAuth();

  Future<HttpClientResponse<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  });

  Future<HttpClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  });

  Future<HttpClientResponse<T>> put<T>(
    String path, {
    T data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  });

  Future<HttpClientResponse<T>> delete<T>(
    String path, {
    T data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  });

  Future<HttpClientResponse<T>> patch<T>(
    String path, {
    T data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Options? options,
  });

  Future<HttpClientResponse<T>> request<T>(
    String path, {
    required String method,
    T data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  });
}
