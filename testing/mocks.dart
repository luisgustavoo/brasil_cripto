import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/data/services/http/http_client_response.dart';
import 'package:mocktail/mocktail.dart';

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

extension HttpMethodMocks on HttpClient {
  void mockGet<T>(String path, T object) {
    when(
      () => get<T>(
        path,
        queryParameters: any(named: 'queryParameters'),
      ),
    ).thenAnswer((invocation) {
      return Future.value(MockHttpClientResponse(data: object));
    });
  }

  void mockPost<T>(String path, Object object) {
    when(
      () => post<T>(
        path,
        data: any(),
        headers: any(),
        options: any(),
        queryParameters: any(),
      ),
    ).thenAnswer((invocation) {
      final response = MockHttpClientResponse<T>();
      return Future.value(response);
    });
  }

  void mockDelete<T>(String path) {
    when(
      () => delete<T>(
        path,
        data: any(),
        headers: any(),
        options: any(),
        queryParameters: any(),
      ),
    ).thenAnswer((invocation) {
      final response = MockHttpClientResponse<T>();
      return Future.value(response);
    });
  }
}
