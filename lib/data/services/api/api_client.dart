import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiClient {
  ApiClient({required HttpClient httpClient}) : _httpClient = httpClient;
  final HttpClient _httpClient;

  Future<void> fetchData() async {
    final response = await _httpClient.get<List<dynamic>>('/coins/markets');
    print(response.data);
    // Handle the response as needed
  }
}
