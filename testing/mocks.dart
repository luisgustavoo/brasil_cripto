import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/data/services/http/http_client_exception.dart';
import 'package:brasil_cripto/data/services/http/http_client_response.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockGoRouter extends Mock implements GoRouter {}

class MockHttpClient extends Mock implements HttpClient {
  MockHttpClient() {
    when(unAuth).thenReturn(this);
    when(auth).thenReturn(this);
  }
}

class MockHttpClientResponse<T> extends Mock implements HttpClientResponse<T> {
  MockHttpClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  @override
  final T? data;
  @override
  final int? statusCode;
  @override
  final String? statusMessage;
}

class MockHttpClientException extends Mock implements HttpClientException {
  MockHttpClientException({
    required this.error,
    this.message,
    this.statusCode,
    this.response,
  });

  @override
  final String? message;
  @override
  final int? statusCode;
  @override
  final dynamic error;
  @override
  final HttpClientResponse<dynamic>? response;
}

extension HttpMethodMocks on HttpClient {
  void mockGet<T>(String path, {Object? object, bool? showError = false}) {
    if (!showError!) {
      when(
        () => get<T>(
          path,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((invocation) async {
        return MockHttpClientResponse(data: object as T?);
      });
    }

    if (showError) {
      when(
        () => get<T>(
          path,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(MockHttpClientException(error: 'Error'));
    }
  }
}
