import 'package:brasil_cripto/data/services/api/models/coins_markets_model.dart';
import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiClient {
  ApiClient({required HttpClient httpClient}) : _httpClient = httpClient;
  final HttpClient _httpClient;

  Future<Result<List<CoinsMarketsModel>>> fetchData() async {
    try {
      final result = await _httpClient.get<List<Map<String, dynamic>>>(
        '/coins/markets',
      );

      switch (result) {
        case Ok():
          final data = result.value.data;
          if (data?.isNotEmpty ?? false) {
            final criptos = data!.map(CoinsMarketsModel.fromJson).toList();
            return Result.ok(criptos);
          } else {
            return const Result.ok(<CoinsMarketsModel>[]);
          }
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
