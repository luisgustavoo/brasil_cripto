import 'package:brasil_cripto/data/repositories/coins_markets_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/domain/models/coins_markets.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CoinsMarketsRepository)
class CoinsMarketsRepositoryRemote implements CoinsMarketsRepository {
  const CoinsMarketsRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;
  @override
  Future<Result<List<CoinsMarkets>>> fetchCoinsMarkets() async {
    try {
      final result = await _apiClient.fetchCoinsMarkets();
      switch (result) {
        case Ok():
          final coinsMarketsList = result.value
              .map(CoinsMarkets.fromApi)
              .toList();
          return Result.ok(coinsMarketsList);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
