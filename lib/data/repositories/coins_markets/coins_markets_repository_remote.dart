import 'dart:async';

import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CoinsMarketsRepository)
class CoinsMarketsRepositoryRemote implements CoinsMarketsRepository {
  CoinsMarketsRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;
  final _coinsMarketsController = StreamController<List<Coin>>.broadcast();

  @override
  Stream<List<Coin>> get coinsMarketsStream => _coinsMarketsController.stream;

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
          _coinsMarketsController.add(coinsMarketsList);
          await _addListener(names, vsCurrency);
          return Result.ok(coinsMarketsList);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<void> _addListener(
    String? names,
    String vsCurrency,
  ) async {
    await _apiClient.startBackGroundFetchCoinsMarkets(
      (
        names: names,
        vsCurrency: vsCurrency,
      ),
    );

    _apiClient.coinsMarketsStream.listen(
      (event) {
        final coinsMarketsList = event.map(Coin.fromApi).toList();
        _coinsMarketsController.add(coinsMarketsList);
      },
    );
  }

  @override
  Future<Result<void>> stopBackGroundFetchCoinsMarkets() async {
    _apiClient.stopBackGroundFetchCoinsMarkets();
    return const Result.ok(null);
  }
}
