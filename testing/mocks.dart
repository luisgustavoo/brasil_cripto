import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/data/services/http/http_client_response.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpClientResponse<T> extends Mock implements HttpClientResponse<T> {}

extension HttpMethodMocks on HttpClient {
  void mockGet<T>(String path, Object object) {
    when(
      () => get<T>(
        path,
        headers: any(),
        options: any(),
        queryParameters: any(),
      ),
    ).thenAnswer((invocation) {
      return Future.value(MockHttpClientResponse<T>());
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
