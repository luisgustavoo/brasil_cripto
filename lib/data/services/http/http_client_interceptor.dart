import 'dart:convert';
import 'dart:developer';

import 'package:brasil_cripto/config/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClientInterceptor extends Interceptor {
  HttpClientInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authRequired = options.extra['auth_required'] as bool? ?? true;
    if (authRequired) {
      options.headers['x-cg-demo-api-key'] = Env.coinGeckoApiKey;
    }
    if (!kReleaseMode) {
      log('########### Request LOG ###########');
      log('url: ${options.uri}');
      log('method: ${options.method}');
      log('data: ${options.data}');
      log('headers: ${options.headers}');
      log('########### Request LOG ###########');
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (!kReleaseMode) {
      log('########### Response LOG ###########');
      log(
        'data: ${const JsonEncoder.withIndent('   ').convert(response.data)}',
      );
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
