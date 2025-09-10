import 'package:brasil_cripto/data/services/http/http_client.dart';

class ApiClient {
  ApiClient({required HttpClient httpClient}) : _httpClient = httpClient;
  final HttpClient _httpClient;
}
