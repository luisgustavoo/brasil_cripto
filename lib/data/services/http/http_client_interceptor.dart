import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClientInterceptor extends Interceptor {
  HttpClientInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (!kReleaseMode) {
      log('########### Response LOG ###########');
      log('data: ${response.data}');
      log('########### Response LOG ###########');
    }

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    log('########### Error LOG ###########');
    log('Error: ', error: err, stackTrace: err.stackTrace);
    log('########### Error LOG ###########');

    handler.next(err);
  }
}
