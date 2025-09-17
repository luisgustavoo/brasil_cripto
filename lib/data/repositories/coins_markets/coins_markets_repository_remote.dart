import 'dart:async';
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CoinsMarketsRepository)
class CoinsMarketsRepositoryRemote implements CoinsMarketsRepository {
  CoinsMarketsRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<List<Coin>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency,
  ) async {
    try {
      final result = await _apiClient.fetchCoinsMarkets(names, vsCurrency);
      switch (result) {
        case Ok():
          final coinsMarketsList = result.value.map(Coin.fromApi).toList();
          return Result.ok(coinsMarketsList);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Market>> fetchCoinsMarketsChart(
    String id,
    String vsCurrency,
    int days,
  ) async {
    try {
      final result = await _apiClient.fetchCoinsMarketsChart(
        id,
        vsCurrency,
        days,
      );
      switch (result) {
        case Ok():
          return Result.ok(Market.fromApi(result.value));
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
