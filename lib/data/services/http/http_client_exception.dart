import 'package:brasil_cripto/data/services/http/http_client_response.dart';

class HttpClientException implements Exception {
  HttpClientException({
    required this.error,
    this.message,
    this.statusCode,
    this.response,
  });

  final String? message;
  final int? statusCode;
  final dynamic error;
  final HttpClientResponse<dynamic>? response;
}
