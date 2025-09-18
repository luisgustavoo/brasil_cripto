import 'dart:async';
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/data/services/api/models/spark_line_api_model.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/domain/models/sparkline.dart';
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
      final result = await _apiClient.fetchCoinsMarkets(
        vsCurrency,
        names: names,
      );
      switch (result) {
        case Ok():
          final coinsMarketsList = result.value.map(
            (coin) {
              return Coin(
                id: coin.id,
                symbol: coin.symbol,
                name: coin.name,
                image: coin.image,
                currentPrice: coin.currentPrice,
                marketCap: coin.marketCap,
                marketCapRank: coin.marketCapRank,
                totalVolume: coin.totalVolume,
                sparkLineIn7d: Sparkline(
                  price: coin.sparkLineIn7d.price,
                ),
                priceChangePercentage1hInCurrency:
                    coin.priceChangePercentage1hInCurrency,
                priceChangePercentage24hInCurrency:
                    coin.priceChangePercentage24hInCurrency,
                priceChangePercentage7dInCurrency:
                    coin.priceChangePercentage7dInCurrency,
              );
            },
          ).toList();
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
        id: id,
        vsCurrency: vsCurrency,
        days: 1,
      );
      switch (result) {
        case Ok():
          return Result.ok(
            Market(
              prices: result.value.prices,
              totalVolumes: result.value.totalVolumes,
              marketCaps: result.value.marketCaps,
            ),
          );
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
